WITH LOCKEDS
     AS (SELECT /*+MATERIALIZE*/
               BLOCKING_SESSION, BLOCKING_INSTANCE
           FROM GV$SESSION
          WHERE     BLOCKING_SESSION IS NOT NULL
                AND EVENT NOT IN ('PX Deq Credit: send blkd',
                                  'PX Deq: Execute Reply'))
    SELECT CASE LEVEL WHEN 1 THEN 'R' ELSE LPAD ('C', LEVEL, '>') END ROOT_CHILD,
           SES.INST_ID,
           SES.SID,
           SES.BLOCKING_INSTANCE,
           SES.BLOCKING_SESSION,
           SES.USERNAME,
           SES.STATUS,
           SES.OSUSER,
           SES.MACHINE,
           SES.PROGRAM,
           SES.SQL_ID,
           SES.LAST_CALL_ET,
           SES.EVENT,
           SES.WAIT_CLASS,
              'ALTER SYSTEM KILL SESSION '''
           || SES.SID
           || ','
           || SES.SERIAL#
           || ',@'
           || SES.INST_ID
           || ''' IMMEDIATE;'
              KILL_SQL
      FROM GV$SESSION SES
START WITH     SES.BLOCKING_SESSION IS NULL
           AND (SES.SID, SES.INST_ID) IN (SELECT *
                                            FROM LOCKEDS)
CONNECT BY     SES.BLOCKING_SESSION = PRIOR SES.SID
           AND SES.BLOCKING_INSTANCE = PRIOR SES.INST_ID;


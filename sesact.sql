col TYPE format a1
col USERNAME format a15
col SERVICE_NAME format a20
col RESOURCE_CONSUMER_GROUP format a25
col status format a10
col FBI format 99
col FBS format 999999
col LOGON_TIME format a17
col EVENT format a34
col CLIENT_INFO format a32
col SQL_ID format a14
col machine format a15
col osuser format a15
col "I#" format 99
col "SC#" format 99
col "#slvs" format 999
col SPID format 999999999
 
prompt NO BACKGROUND,ACTIVE SLAVES,ACTIVE SINGLES

WiTH PAR_SES
     AS (  SELECT 'P' TYPE,
                  ROUND (BITAND (s.ownerid, 16711680) / 65536) inst_id,
                  ROUND (BITAND (s.ownerid, 65535)) sid,
                  COUNT (*) "#slvs"
             FROM GV$SESSION S
            WHERE     TYPE != 'BACKGROUND'
               --          AND status = 'ACTIVE'
                  AND ROUND (BITAND (s.ownerid, 65535)) != 65532
                  AND (inst_id, sid) NOT IN (SELECT distinct inst_id, sid
                                           FROM gv$mystat)
         GROUP BY ROUND (BITAND (s.ownerid, 65535)),
                  ROUND (BITAND (s.ownerid, 16711680) / 65536))
SELECT a.TYPE,
         s.username,
         s.inst_id "I#",
         s.sid,
         S.SERIAL#,
         to_number(p.spid) SPID,
         a."#SLVS",
         to_char(s.logon_time,'YYYYMMDD HH24:MI:SS') LOGON_TIME,
         S.LAST_CALL_ET LC_ET,
         s.sql_id,
         s.sql_child_number "SC#",
--         s.status,
         s.machine,    
         s.osuser,
         s.final_blocking_instance fbi,
         S.FINAL_BLOCKING_SESSION fbs,
--         s.final_blocking_session_status fbs_status,
         s.event
--         s.resource_consumer_group,
--         s.service_name,
--         s.client_info
    FROM (SELECT 'S' TYPE,
                 s.inst_id,
                 s.sid,
                 1 "#SLVS"
            FROM gv$session s
           WHERE     TYPE != 'BACKGROUND'
                 AND status = 'ACTIVE'
                 AND ROUND (BITAND (s.ownerid, 65535)) = 65532
                 AND (inst_id, sid) NOT IN (SELECT inst_id, sid FROM par_ses)
                 AND (inst_id, sid) NOT IN (SELECT distinct  inst_id, sid
                                          FROM gv$mystat)
          UNION
          SELECT * FROM par_ses) a,
         gv$session s,gv$process p
   WHERE     a.inst_id = s.inst_id
         AND a.sid = s.sid
         AND s.PADDR=p.ADDR
         AND s.inst_id=p.inst_id
         AND s.username IS NOT NULL
         AND (s.STATUS='ACTIVE' or ROUND (BITAND (s.ownerid, 65535)) != 65532)
         AND (s.username != 'SYS' or s.osuser !='root')
         AND (sql_id not in ('g0bggfqrddc4w')) --get rid of dbsnmp
ORDER BY last_call_et DESC;



prompt
prompt USE @s1 <inst_id> <sid>  for more info on a single session. 
prompt USE @smt <inst_id> <sid> for text base sql monitor.
prompt USE @sma <inst_id> <sid> for html base sql monitor.
prompt USE @sqlid <sql_id>      for sql_id and details.

--undef 1 2 3 4 5 6 7 8 9


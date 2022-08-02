col USERNAME format a16
col SERVICE_NAME format a10
col CLIENT_INFO format a32
col SQL_ID format a14
col terminal format a15
col osuser format a15
col I# format 99
col SC# format 99

 
prompt NO SYS,NO BACKGROUND,ACTIVE SLAVES,ACTIVE SINGLES
WITH PAR_SES
     AS (  SELECT 'P' TYPE,
                  ROUND (BITAND (s.ownerid, 16711680) / 65536) inst_id,
                  ROUND (BITAND (s.ownerid, 65535)) sid,
                  COUNT (*) "#slaves"
             FROM GV$SESSION S
            WHERE     TYPE != 'BACKGROUND'
		  AND  sql_id = '&1'
                  --       AND status = 'ACTIVE'
                  AND ROUND (BITAND (s.ownerid, 65535)) != 65532
                  AND (inst_id, sid) != (SELECT inst_id, sid
                                           FROM gv$mystat
                                          WHERE ROWNUM = 1)
         GROUP BY ROUND (BITAND (s.ownerid, 65535)),
                  ROUND (BITAND (s.ownerid, 16711680) / 65536))
  SELECT a.TYPE,
         s.username,
         s.inst_id "I#",
         s.sid,
         S.SERIAL#,
         a."#slaves",
         s.logon_time,
         S.LAST_CALL_ET,
         s.sql_id,
         s.sql_child_number "SC#",
         s.status,
         s.terminal,
         s.osuser,
         s.final_blocking_instance fbi,
         S.FINAL_BLOCKING_SESSION fbs,
         s.final_blocking_session_status fbs_status,
         s.event,
         s.resource_consumer_group,
         s.service_name,
         s.client_info
    FROM (SELECT 'S' TYPE,
                 s.inst_id,
                 s.sid,
                 1 "#slaves"
            FROM gv$session s
           WHERE     TYPE != 'BACKGROUND'
                 AND  sql_id = '&1'
                 AND status = 'ACTIVE'
                 AND ROUND (BITAND (s.ownerid, 65535)) = 65532
                 AND (inst_id, sid) NOT IN (SELECT inst_id, sid FROM par_ses)
                 AND (inst_id, sid) != (SELECT inst_id, sid
                                          FROM gv$mystat
                                         WHERE ROWNUM = 1)
          UNION
          SELECT * FROM par_ses) a,
         gv$session s
   WHERE     a.inst_id = s.inst_id
         AND a.sid = s.sid
         AND s.username IS NOT NULL
         AND s.username != 'SYS'
ORDER BY last_call_et DESC;


prompt
prompt USE @s1 <inst_id> <sid>  for more info on a single session. 
prompt USE @smt <inst_id> <sid> for text base sql monitor.
prompt USE @sma <inst_id> <sid> for html base sql monitor.
undef 1 2 3 4 5 6 7 8 9


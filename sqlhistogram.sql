prompt sqlhistogram for a user from ASH for the last one hour and runcount > 100
col 1 for 99999999
col max_run_time for A35
col 2 for 99999999
col 3 for 99999999
col 4 for 99999999
col 5 for 99999999
col 6 for 99999999
col 7 for 99999999
col 8 for 99999999
col 9 for 99999999
col 10 for 99999999
col av for 99999
col ct for 99999999
col mn for 999
col av for 99999.9
col longest_sql_exec_id for A10

WITH pivot_data AS (
SELECT
      sql_id,
      ct,
      mxdelta mx,
      mndelta mn,
      round(avdelta) av,
      WIDTH_BUCKET(delta_in_seconds,mndelta,mxdelta+.1,10) AS bucket  ,
      SUBSTR(times,12) max_run_time,
      SUBSTR(longest_sql_exec_id, 12) longest_sql_exec_id
FROM (
SELECT
   sql_id,
   delta_in_seconds,
   COUNT(*) OVER (PARTITION BY sql_id) ct,
   MAX(delta_in_seconds) OVER (PARTITION BY sql_id) mxdelta,
   MIN(delta_in_seconds) OVER (PARTITION BY sql_id) mndelta,
   AVG(delta_in_seconds) OVER (PARTITION BY sql_id) avdelta,
   MAX(times) OVER (PARTITION BY sql_id) times,
   MAX(longest_sql_exec_id) OVER (PARTITION BY sql_id) longest_sql_exec_id
FROM (
   SELECT
        sql_id,
        sql_exec_id,
        MAX(delta_in_seconds) delta_in_seconds ,
        LPAD(ROUND(MAX(delta_in_seconds),0),10) || ' ' ||
        TO_CHAR(MIN(start_time),'YY-MM-DD HH24:MI:SS')  || ' ' ||
        TO_CHAR(MAX(end_time),'YY-MM-DD HH24:MI:SS')  times,
        LPAD(ROUND(MAX(delta_in_seconds),0),10) || ' ' ||
        TO_CHAR(MAX(sql_exec_id)) longest_sql_exec_id
   FROM ( SELECT
                                            sql_id,
                                            sql_exec_id,
              CAST(sample_time AS DATE)     end_time,
              CAST(sql_exec_start AS DATE)  start_time,
              ((CAST(sample_time    AS DATE)) -
               (CAST(sql_exec_start AS DATE))) * (3600*24) delta_in_seconds
           FROM
              gv$active_Session_history
           WHERE sql_exec_id IS NOT NULL and sample_time > sysdate - 2/24
           and user_id=(select user_id from dba_users where username='&1')            
        )
   GROUP BY sql_id,sql_exec_id
)
)
where ct >10
)
SELECT * FROM pivot_data
PIVOT ( COUNT(*) FOR bucket IN (1,2,3,4,5,6,7,8,9,10))
ORDER BY mx DESC,av DESC
;
undef 1 2 3 4 5 6 7 8 9


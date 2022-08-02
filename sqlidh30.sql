prompt historical performance of a sql_id(var 1 ) For the last 30 days
prompt  use sta sqildhf force_matching_signature for the last 7 days

col parsing_schema_name format a11



col begin_interval_time format a30

col i# format 99
col force_matching_signature format a32

SELECT b.instance_number i#,plan_hash_value,to_char(force_matching_signature) force_matching_signture,a.PARSING_SCHEMA_NAME,b.begin_interval_time, a.executions_delta exec_delta,
       round(a.buffer_gets_delta / decode(executions_delta,NULL,0,1),1) buffer_gets,
       round(a.DISK_READS_DELTA / decode(executions_delta,NULL,0,1),1) disk_reads,
       round(elapsed_time_delta / decode(executions_delta,NULL,0,1) / 1000000,4) elapsed_sn,
             round(cpu_time_delta / decode(executions_delta,NULL,0,1) / 1000000,4) cpu_sn,
             round(a.rows_processed_delta/decode(executions_delta,NULL,0,1),1) rows_proccessed
  FROM dba_hist_sqlstat a, dba_hist_snapshot b
WHERE a.sql_id = TRIM('&1') AND a.snap_id = b.snap_id
--and executions_delta >0 
AND begin_interval_time > sysdate -35
and a.instance_number=b.instance_number
order by begin_interval_time;


undef sql_id
undef instance_number


undef 1 2 3 4 5 6 7 8 9

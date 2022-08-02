prompt historical performance of a force_matching_signature(var 1 ) for the last 7 days
col begin_interval_time format a40
col parsing_schema_name format a10




SELECT b.instance_number i#,plan_hash_value,a.PARSING_SCHEMA_NAME,b.begin_interval_time, a.executions_delta exec_delta,
       round(a.buffer_gets_delta / executions_delta,1) buffer_gets,
       round(a.DISK_READS_DELTA / executions_delta,1) disk_reads,
       round(elapsed_time_delta / executions_delta / 1000000,4) elapsed_sn,
             round(cpu_time_delta / executions_delta / 1000000,4) cpu_sn,
             round(a.rows_processed_delta/executions_delta,1) rows_proccessed, sql_id
  FROM dba_hist_sqlstat a, dba_hist_snapshot b
WHERE a.force_matching_signature = '&1' AND a.snap_id = b.snap_id
and executions_delta >0 AND begin_interval_time > sysdate -7
and a.instance_number=b.instance_number
order by begin_interval_time;


undef sql_id
undef instance_number

undef 1 2 3 4 5 6 7 8 9

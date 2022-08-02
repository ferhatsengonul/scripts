col running_for format a20
col "b/sec (input)" format a20
col "b/sec (output)" format a20
col "tb/hour (input)" format 9999.99 
col "tb/hour (output)" format 9999.99
col ESTIMATED_FINISH_TIME format a20

SELECT INPUT_TYPE,
       STATUS,
       TO_CHAR (START_TIME, 'dd/mm/yy hh24:mi') start_time,
       TIME_TAKEN_DISPLAY running_for,
       INPUT_BYTES_PER_SEC_DISPLAY "b/sec (input)",
       OUTPUT_BYTES_PER_SEC_DISPLAY "b/sec (output)",
       round((INPUT_BYTES_PER_SEC / 1024 / 1024 / 1024 / 1024) * 60 * 60,2) "tb/hour (input)",
       round((OUTPUT_BYTES_PER_SEC / 1024 / 1024 / 1024 / 1024) * 60 * 60,2)  "tb/hour (output)"
  FROM V$RMAN_BACKUP_JOB_DETAILS
WHERE status = 'RUNNING';

SELECT round(dbsize_mbytes / 1024,2) "DB_SIZE_GB",
       round(input_bytes / 1024 / 1024,2) input_mbytes,
       round(output_bytes / 1024 / 1024,2) output_mbytes,
       round((mbytes_processed / dbsize_mbytes * 100)) PERCENT_FINISHED,
       TO_CHAR (
            start_time
          + (SYSDATE - start_time) / (mbytes_processed / dbsize_mbytes),
          'DD/mm/yy HH24:MI') ESTIMATED_FINISH_TIME
  FROM v$rman_status rs,
       (SELECT SUM (bytes) / 1024 / 1024 dbsize_mbytes FROM v$datafile)
WHERE status = 'RUNNING' AND output_device_type IS NOT NULL;

undef 1 2 3 4 5 6 7 8 9


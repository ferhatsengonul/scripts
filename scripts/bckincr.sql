set arraysize 3000
column start_time format a16
column end_time format a16
column in_size format a10
column out_size format a10
column out_per_sec format a10
column in_per_sec format a10
column STATUS format a30

 SELECT SESSION_KEY,
         INPUT_TYPE,
         STATUS,
         TO_CHAR (START_TIME, 'yy/mm/dd hh24:mi') start_time,
         TO_CHAR (END_TIME, 'yy/mm/dd hh24:mi') end_time,
         ROUND (elapsed_seconds / 3600, 1) hour,
         ROUND (elapsed_seconds / 60, 0) minutes,
         INPUT_BYTES_PER_SEC_DISPLAY in_per_sec,
         OUTPUT_BYTES_PER_SEC_DISPLAY out_per_sec,
         INPUT_BYTES_DISPLAY in_size,
         OUTPUT_BYTES_DISPLAY out_size,
	 SESSION_STAMP 
    FROM V$RMAN_BACKUP_JOB_DETAILS
 WHERE input_type IN ('DB INCR')
       and OUTPUT_DEVICE_TYPE is not null
ORDER BY session_key asc;

prompt use @bckfull ; @bckincr for db backups; @bckarc for archieve backups , @bcklog SESSION_STAMP=12345 for the rman log
undef 1 2 3 4 5 6 7 8 9


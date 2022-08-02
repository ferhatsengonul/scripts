col sql_sql_text head SQL_TEXT format a80 word_wrap
col sql_child_number head CH# for 999
col parsing_schema_name head PARSE_SCHEMA for a20
col sql_profile for a20
col FORCE_MATCHING_SIGNATURE format 99999999999999999999999
col first_load_time format a19
col LAST_ACTIVE_TIME format a19

prompt Show SQL text, child cursors and execution stats for SQLID &1 

select  distinct
	hash_value,
	child_number	sql_child_number,
        plan_hash_value plan_hash,
        PARSING_SCHEMA_NAME, 
	dbms_lob.substr(sql_fulltext,4000) sql_sql_text,
        sql_profile,
	force_matching_signature
from 
	gv$sql 
where 
	sql_id = ('&1')
order by
	hash_value,
	child_number,
        PARSING_SCHEMA_NAME;

select
	inst_id,
        child_number    sql_child_number,
--        address         parent_handle,
--        child_address   object_handle,
--        plan_hash_value plan_hash,
        parse_calls parses,
        loads h_parses,
        executions,
        fetches,
        rows_processed,
        round(cpu_time/1000/1000,2) cpu_sec,
        round(elapsed_time/1000/1000,2) ela_sec,
        buffer_gets LIOS,
        disk_reads PIOS,
        sorts,
--      force_matching_signature,
        first_load_time,
        LAST_ACTIVE_TIME
--      parsing_schema_name,
--      sql_profile
--      address
--      users_executing
from
        gv$sql
where
        sql_id = ('&1')
order by
        LAST_ACTIVE_TIME desc;			
		
		
select distinct       sql_id,force_matching_signature
from
        gv$sql
where
        sql_id = ('&1');
	

prompt @sqlidh &1 for history
prompt @sqlids &1 for sessions running this sql
prompt @sqls TIMS  for sqls from this user
prompt @sqlhistogram TIMS   for sqlhistogram from this user
prompt @sqlx &1 CHILD_NUMBER INST_ID  (last exeqution plan for rac)
prompt @sqlxp &1 PLAN_HASH_VALUE CHILD_NUMBER INST_ID (last execution plan for plan_hash_value)
prompt @sqlxa &1 PLAN_HASH_VALUE (execution plan from AWR)
undef 1 2 3 4 5 6 7 8 9


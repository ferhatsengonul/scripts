--prompt Running DBMS_SQLTUNE.REPORT_SQL_MONITOR template 
set heading off
SELECT
	DBMS_SQLTUNE.REPORT_SQL_MONITOR(   
	   type 	=> 	'&1',
           inst_id	=>	&2,
	   session_id	=>	&3,
	   report_level	=>	'ALL'
	   ) as report   
FROM dual
/
set heading on
undef 1 2 3 4 5 6 7 8 9


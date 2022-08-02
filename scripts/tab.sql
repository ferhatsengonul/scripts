prompt info from dba_tables
#set termout off
@@tab2 "&1"
set termout on
@@pr
set timing on
--
prompt info from dba_part_tables
set termout off
@@tab3 "&1"
set termout on
@@pr
set timing on

prompt info from dba_tab_partitions
@@tab4.sql
undef 1 2 3 4 5 6 7 8 9

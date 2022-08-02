
set termout off

spool &SQLPATH/tmp/xprof_&_i_inst..html

@@sqlmontmp ACTIVE &1 &2 

spool off

host &_start &SQLPATH/tmp/xprof_&_i_inst..html &
set termout on
undef 1 2 3 4 5 6 7 8 9

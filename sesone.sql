--@@pr "select g.* from gv$session g where inst_id=&1 and sid=&2"
@@printtab "select g.* from gv$session g where inst_id=&1 and sid=&2"
set timing on
undef 1 2 3 4 5 6 7 8 9


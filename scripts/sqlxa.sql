select * from  table(dbms_xplan.display_awr('&1', &2, null,'ADVANCED ALLSTATS LAST')) t;

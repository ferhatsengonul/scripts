-- calling init.sql which will set up sqlpus variables
@init.sql
-- i.sql is the "who am i" script which shows your session/instance info and 
-- also sets command prompt window/xterm title
@i.sql

-- you can put your own login scripts here

def  _FS_IDENTIFIER ="&_CONNECT_IDENTIFIER"
col connection new_value _FS_IDENTIFIER
select case when length('&_FS_IDENTIFIER') > 10 THEN substr('&_FS_IDENTIFIER',1,10) else '&_FS_IDENTIFIER' end as connection    from dual;

#set sqlprompt "_USER'@'_CONNECT_IDENTIFIER _DATE SQL> "
set sqlprompt "_USER'@'_FS_IDENTIFIER _DATE SQL> "
set TIMING on
--host stty echo
undef 1 2 3 4 5 6 7 8 9

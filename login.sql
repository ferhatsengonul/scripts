-- calling init.sql which will set up sqlpus variables
@init.sql
-- i.sql is the "who am i" script which shows your session/instance info and 
-- also sets command prompt window/xterm title
@i.sql

-- you can put your own login scripts here

set sqlprompt "_USER'@'_CONNECT_IDENTIFIER _DATE SQL> "
set TIMING on
--host stty echo
undef 1 2 3 4 5 6 7 8 9
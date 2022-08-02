set escape '\'
--host &_start http://www.oracle.com/pls/db112/search?remark=quick_search\&word=&1
host &_start http://www.oracle.com/pls/db112/search?word=&1 &
--http://www.oracle.com/pls/db112/search?word=table&partno=
set escape off
undef 1 2 3 4 5 6 7 8 9

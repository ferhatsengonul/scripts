col metric_name format a30
col metric_unit format a30
--sta pr2 "select distinct metric_name from v$SYSMETRIC where  group_id=3 order by metric_name"
sta pr2 "select  metric_id||metric_name as my from v$SYSMETRIC where  group_id=3 order by metric_name"

ACCEPT metric_id NUM PROMPT 'Metric ID:  '

select * from v$SYSMETRIC where  metric_id=&metric_id and group_id=3 order by metric_name;


prompt 15 sec snapshots for the last 3 minutes

BREAK ON REPORT
COMPUTE AVG SUM OF 1 2 3 4 5 6 7 8 9 10 11 12 13 ON REPORT
--COMPUTE AVG LABEL AVG   OF 1 2 3 4 5 6 7 8 9 10 11 12 13 ON REPORT
--COMPUTE SUM LABEL SUM   OF 1 2 3 4 5 6 7 8 9 10 11 12 13 ON REPORT

WITH T AS(  SELECT inst_id,RANK () OVER (PARTITION BY inst_id ORDER BY begin_time) interval13, ROUND (VALUE, 2) VALUE
    FROM gv$SYSMETRIC_history
   WHERE metric_id = &metric_id AND GROUP_ID = 3
ORDER BY 1,2 ASC)
select * from t pivot(sum(value) for (interval13) IN (1,2,3,4,5,6,7,8,9,10,11,12,13)); 

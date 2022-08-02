col metric_name format a30
col metric_unit format a30
--sta pr2 "select distinct metric_name from v$SYSMETRIC where  group_id=2 order by metric_name"
sta pr2 "select  metric_id||metric_name as my from v$SYSMETRIC where  group_id=2 order by metric_name"

ACCEPT metric_id NUM PROMPT 'Metric ID:  '

select * from v$SYSMETRIC where  metric_id=&metric_id and group_id=2 order by metric_name;


prompt 1 hour average snapshots for the last 13 hour

BREAK ON REPORT
COMPUTE AVG SUM OF 1 2 3 4 5 6 7 8 9 10 11 12 13 ON REPORT
--COMPUTE AVG LABEL AVG   OF 1 2 3 4 5 6 7 8 9 10 11 12 13 ON REPORT
--COMPUTE SUM LABEL SUM   OF 1 2 3 4 5 6 7 8 9 10 11 12 13 ON REPORT

WITH T AS (SELECT instance_number,RANK () OVER (PARTITION BY instance_number ORDER BY begin_time) interval13, ROUND (AVERAGE, 2) VALUE
    FROM dba_hist_SYSMETRIC_summary
   WHERE metric_id = &metric_id AND GROUP_ID = 2 
   AND snap_id > (select min(snap_id) from dba_hist_snapshot where begin_interval_time > sysdate - 15/24)
ORDER BY 1,2 ASC)
select * from t pivot(sum(value) for (interval13) IN (1,2,3,4,5,6,7,8,9,10,11,12,13));

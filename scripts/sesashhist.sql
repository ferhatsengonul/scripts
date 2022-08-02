ACCEPT STARTTIME PROMPT 'STARTTIME YYYY-MM-DD HH24:MI:SS : '
ACCEPT ENDTIME  PROMPT 'ENDTIME   YYYY-MM-DD HH24:MI:SS : '
select * from (
select sql_id,to_CHAR(force_matching_signature),count(*)*10 ash_secs, 
    sum(count(*)*10) over() total_cnt,
    round(100*(count(*)*10 / sum(count(*)*10) over ()),2) perc
from dba_hist_active_sess_history
where snap_id between (select distinct snap_id from dba_hist_snapshot where TIMESTAMP'&STARTTIME' between begin_interval_time and end_interval_time) 
      and (select distinct snap_id from dba_hist_snapshot where TIMESTAMP'&ENDTIME' between begin_interval_time and end_interval_time) 
and session_type = 'FOREGROUND' 
group by sql_id,to_char(force_matching_signature)
order by 3 desc)
where rownum < 10;
undef 1 2 3 4 5 6 7 8 9


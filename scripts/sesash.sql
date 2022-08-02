prompt ash_counts for last &1 seconds
undef ASH_SECS_PERCENT
col ASH_SECS_PERCENT new_value ASH_SECS_PERCENT
 
column ON_CPU format 999.9
column Conc format 99.9
column UIO format 99.9
column SIO format 99.9
column Adm format 99.9
column Oth format 99.9
column Conf format 99.9
column Sche format 99.9
column CLST format 99.9
column App format 99.9
column Que format 99.9
column Idle format 99.9
column Ntw format 99.9
column Cmt format 99.9
column TOTAL format 999.9
 
select count(*) number_of_nodes,avg(value)/2 number_of_threads,
       &1 sample_secs, sum(value)*&1/2 ash_Secs,round(sum(value)*&1/100/2) AS ASH_SECS_PERCENT from gv$parameter where name='cpu_count';
 
WITH ASH_SECS AS
(select sql_id,
ON_CPU,CONC,UIO,SIO, ADM, OTH, CONF, SCHE, CLST, APP, QUE, IDLE, NTW, CMT,
ON_CPU+CONC+UIO+ SIO+ ADM+ OTH+ CONF+ SCHE+ CLST+ APP+ QUE+ IDLE+ NTW+ CMT total
from
(select ash.sql_id,nvl(EN.WAIT_CLASS,'ON_CPU') class from gv$active_Session_history ash, v$event_name en
where ash.sample_time > sysdate - interval '&1' second
and ash.SQL_ID is not NULL and en.event# (+)=ash.event#
)
PIVOT (count(*) FOR class IN ('ON_CPU' ON_CPU,'Concurrency' Conc,'User I/O' UIO,'System I/O' SIO,'Administrative' Adm,'Other' Oth,
'Configuration' Conf ,'Scheduler' Sche,'Cluster' "CLST",'Application' App,'Queueing' Que,'Idle' Idle,'Network' Ntw,'Commit' Cmt )))
 select * from  
    (select sql_id,sum(ON_CPU)/&&ASH_SECS_PERCENT ON_CPU,sum(CONC)/&&ASH_SECS_PERCENT CONC,sum(UIO)/&&ASH_SECS_PERCENT UIO,sum(SIO)/&&ASH_SECS_PERCENT SIO, 
    sum(ADM)/&&ASH_SECS_PERCENT ADM, sum(OTH)/&&ASH_SECS_PERCENT OTH , sum(CONF)/&&ASH_SECS_PERCENT CONF, sum(SCHE)/&&ASH_SECS_PERCENT SCHE,
     sum(CLST)/&&ASH_SECS_PERCENT CLST , sum(APP)/&&ASH_SECS_PERCENT APP,sum(QUE)/&&ASH_SECS_PERCENT QUE, sum(IDLE)/&&ASH_SECS_PERCENT IDLE, 
     sum(NTW)/&&ASH_SECS_PERCENT NTW, sum(CMT)/&&ASH_SECS_PERCENT CMT,sum(TOTAL)/&&ASH_SECS_PERCENT TOTAL from ash_secs
    group by rollup(sql_id)
    order by TOTAL desc)
 where rownum < 31;
undef 1 2 3 4 5 6 7 8 9


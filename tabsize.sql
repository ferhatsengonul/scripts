select 'TABLE SIZE' type ,owner,segment_name,round(sum(bytes)/power(1024,3),2) GB from dba_segments where owner='&&1' and segment_name='&&2'
group by 'TABLE SIZE',owner,segment_name
union all
select 'LOB SIZE' type,s.owner,s.segment_name,round(sum(bytes)/power(1024,3),2) GB from dba_segments s, dba_lobs l
where s.owner=l.owner and s.segment_name=l.segment_name
and l.owner='&1' and l.table_name= '&2'
group by 'LOB SIZE',s.owner,s.segment_name;

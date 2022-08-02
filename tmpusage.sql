WITH ses as
(SELECT /*+ MATERIALIZE */ a.inst_id,a.sid,a.username,a.osuser,a.machine,a.sql_id,b.tablespace,b.segtype,b.blocks*P.VALUE temp_size,
           ROUND (BITAND (a.ownerid, 16711680) / 65536) parent_inst,
           ROUND (BITAND (a.ownerid, 65535)) parent_sid
      FROM gv$session a, gv$sort_usage b, gv$parameter p
    WHERE     p.name = 'db_block_size'
           AND a.saddr = b.session_addr
           AND a.inst_id = b.inst_id 
           AND a.inst_id = p.inst_id
    ORDER BY 3 DESC, 2 DESC),
combined as
(
    /* serial ones */
    select ses.* from ses
    where parent_inst=255
    union all
    /*parallel ones */
    select parent_inst inst_id,parent_sid  sid , username,osuser,machine,sql_id,tablespace,segtype,temp_size,0,0 from ses
    where parent_inst!=255),
most_temp as
(select inst_id,sid,tablespace,round(sum(temp_size)/1024/1024/1024,2) GB from combined
    --group by rollup (inst_id,sid,tablespace)
    group by inst_id,sid,tablespace
    order by 4 desc)
select * from 
(select m.*,s.username,s.osuser,s.sql_id,s.sql_exec_start from most_temp m, gv$session s
where m.inst_id=s.inst_id and m.sid=s.sid
order by 4 desc)
where rownum < 25;

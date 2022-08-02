
select h.tablespace_name,
       round(sum(h.bytes_free + h.bytes_used) / 1048576/ 1024) gbs_alloc,
       round(sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / 1048576/1024 ) gbs_free,
       round(sum(nvl(p.bytes_used, 0))/ 1048576/1024) gbs_used,
 --      round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100) Pct_Free,
       100 - round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100) pct_used,
       round(sum(decode(f.autoextensible, 'YES', f.maxbytes, 'NO', f.bytes) / 1048576/1024)) gbs_max,
      c.status --, c.contents
from   sys.v_$TEMP_SPACE_HEADER h,
       (select tablespace_name, file_id, sum(bytes_used) bytes_used
	        from gv$temp_extent_pool
		        group by tablespace_name, file_id) p,
		       dba_temp_files f,
		      dba_tablespaces c
		where  p.file_id(+) = h.file_id
		and    p.tablespace_name(+) = h.tablespace_name
		and    f.file_id = h.file_id
		and    f.tablespace_name = h.tablespace_name
		and f.tablespace_name = c.tablespace_name
		group by h.tablespace_name, c.status, c.contents
		ORDER BY 6;

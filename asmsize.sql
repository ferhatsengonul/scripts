col top_name for a15

truncate table ASM_MAP_TEMP;

drop table ASM_MAP_TEMP;

create table ASM_MAP_TEMP as
--on commit preserve rows as 
WITH usage_size
     AS (  SELECT /*+ MATERIALIZE */
                 group_number,
                  root_id,
                  TYPE,
                  ROUND (SUM (bytes) / POWER (1024, 4), 3) TB
             FROM (    SELECT aa.group_number,
                              CONNECT_BY_ROOT REFERENCE_INDEX ROOT_ID,
                              af.TYPE,
                              af.bytes,
                              LEVEL level_of
                         FROM v$asm_alias aa, V$ASM_FILE af
                        WHERE     aa.GROUP_NUMBER = af.GROUP_NUMBER(+)
                              AND aa.FILE_NUMBER = af.FILE_NUMBER(+)
                              AND aa.FILE_INCARNATION = af.INCARNATION(+)
                   START WITH (MOD (PARENT_INDEX, POWER (2, 24))) = 0
                   CONNECT BY PRIOR REFERENCE_INDEX = PARENT_INDEX)
            WHERE level_of != 1
         GROUP BY group_number, root_id, TYPE),
     alias AS (SELECT /*+ MATERIALIZE */ * FROM v$asm_alias WHERE (MOD (PARENT_INDEX, POWER (2, 24))) = 0),
     disk_group AS (SELECT /*+ MATERIALIZE */ * FROM v$asm_diskgroup)
SELECT ad.name GROUP_NAME,
       AA.NAME TOP_NAME,
       usage_size.TYPE FILE_TYPE,
       usage_size.tb USED_TB
  FROM usage_size, disk_group ad, alias aa
 WHERE     usage_size.group_number = ad.group_number
       AND usage_size.root_id = aa.reference_index
       AND usage_size.TYPE is not null;       
       
       
select a.group_name,sum(used_TB) used_TB,b.free_TB from asm_map_temp a,(select NAME,round(USABLE_FILE_MB/1024/1024,3) free_TB from v$asm_diskgroup) b 
where a.group_name=b.name
group by a.group_name,b.free_TB;

pause Press enter for DATA diskgroup usage

select * from
(select top_name,file_type,used_Tb from asm_map_temp where group_name like 'DATA%')
PIVOT
(sum(used_TB) for FILE_TYPE in ('FLASHBACK','ONLINELOG','TEMPFILE','DATAFILE','ARCHIVELOG'))
order by 1;

pause Press enter for RECO diskgroup usage

select * from
(select top_name,file_type,used_Tb from asm_map_temp where group_name like 'RECO%')
PIVOT
(sum(used_TB) for FILE_TYPE in ('FLASHBACK','ONLINELOG','TEMPFILE','DATAFILE','ARCHIVELOG'))
order by 1;

undef 1 2 3 4 5 6 7 8 9

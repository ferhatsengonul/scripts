col TABLE_OWNER FORMAT A20
col TABLE_NAME FORMAT A30
col PARTITION_NAME FORMAT A30
col SUBPARTITION_COUNT  HEAD "SUB_COUNT" FORMAT 999
col high_value head HIGH_VALUE_RAW for a100


select * from dba_tab_partitions 
where
    table_name = 
                upper(CASE 
                    WHEN INSTR('&1','.') > 0 THEN 
                        SUBSTR('&1',INSTR('&1','.')+1)
                    ELSE
                        '&1'
                    END
                     )
AND table_owner =
        CASE WHEN INSTR('&1','.') > 0 THEN
            UPPER(SUBSTR('&1',1,INSTR('&1','.')-1))
        ELSE
            user
        END;

col owner format a30
col trigger_name format a30
col triggering_event format a10
col table_owner format a30

select owner,trigger_name,triggering_Event,table_owner,status from dba_triggers  where triggering_Event in ('LOGON ','LOGOFF ','ERROR ','DDL ');
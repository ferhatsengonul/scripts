prompt info from dba_tables
select
	case 
		when cluster_name is not null then 'CLU'
		when partitioned = 'NO'  and iot_name is not null then 'IOT'
		when partitioned = 'YES' and iot_name is not null then 'PIOT'
		when partitioned = 'NO' and iot_name is null then 'TAB'
		when partitioned = 'YES' and iot_name is null then 'PTAB'
		when temporary = 'Y' then 'TEMP'
		else 'OTHR'
	end 				tab_type,
	dt.*
from
	dba_tables dt
where
	table_name =
				upper(CASE 
					WHEN INSTR('&1','.') > 0 THEN 
					    SUBSTR('&1',INSTR('&1','.')+1)
					ELSE
					    '&1'
					END
				     ) 
AND	owner =
		CASE WHEN INSTR('&1','.') > 0 THEN
			UPPER(SUBSTR('&1',1,INSTR('&1','.')-1))
		ELSE
			user
		END ;


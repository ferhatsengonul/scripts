session
sesact.sql		Active sessions
sesone.sql  		Session information for a single session. <inst_id> <sid>
sesash.sql		ash_counts for last &1 seconds
sesashhist.sql		ash hist for the given times
sesnls.sql		nls for session,instance,database
sesres.sql		query dba_resumable
seslck.sql		gets the lockers and waiters.


sql
sqlid.sql		sql_text and v$sql <sql_id>
sqlidh.sql		history from dba_hist_sqlstat <sql_id>
sqlids.sql		sqlids sessions running this sql <sql_id>
sqlhistogram.sql 	sqlhistogram for a user from ASH for the last one hour and runcount > 100 <username>

sqlmon
sqlmona.sql		report_sql_monitor active template/calls sqlmontmp
sqlmont.sql		report_sql_monitor text template/calls sqlmontmp
sqlmontmp.sql  		report_sql_monitor base template
sqlx.sql		dbms_xplan.display for RAC environment  <sql_id> <child_number> <inst_id>
sqlxp.sql		dbms_xplan.display for RAC environment  <sql_id> <plan_hash_value> <child_number> <inst_id>
sqlxa.sql		dbms_xplan.display_awr for RAC environment  <sql_id> <plan_hash_value> 
x.sql			dbms_xplan.display for the last explain for query
coe.sql			carlos sierra sql profile script

backup
bckall.sql		backup list  for all 
bckarc.sql 	    	backup list  for archieve backups
bckfull.sql    		backup list  for full backups
bckincr.sql    		backup list  for incremental backups
bckrecover.sql    	backup incremental recovery
bcklog.sql      	backup logs	
bckstat.sql    	        backups backup statistics for the running backup


helpers
help.sql		Search index.txt
login1.sql		First to run.Calls init.sql and i.sql
init.sql		Initialise the variables.
i.sql			Who am I?
loadset.sql		Needed for nternal use
saveset.sql		Needed for internal use
printtab.sql		AskTom's row viewer.
es.sql			Edit script <script_name>
pr.sql			Modified printtab, adding multi column displayafor a single row multi column
pr2.sql			Modified printtab, another vairant for a single column multi row output.
dict.sql		Query dictionary
doc.sql			Search oracle documentation

kill
kill.sql		generate kill scripts with commands.
killr.sql		generate kill scripts without commands.

nls
nls.sql			nls parameters for session,database and instance

shortcuts
s.sql			Shortcut to sesact Active sessions.
s1.sql 			Shortcut to sesone session info. <inst_id> <sid>
sma.sql			calls sqlmona


met
met15sec.sql		metric data for the last 13 15sec interval
met1min.sql		metric data for the last 13 1min interval
met1hour.sql		metric data for the last 13 1hour interval (average)

tmp
tmpusage.sql		temp tablespace usage of sessions
tmpts.sql		temp tablespace size usage of sessions

asm
asmsize			asm disksize usage for all dbs

trigger			show system wide triggers


compression
cmrchk                  @cmrchk <owner><table><rest>    compress check for table with sample (0.01) or part @cmrchk owner table "partition(P2014040) sample(0.01)"


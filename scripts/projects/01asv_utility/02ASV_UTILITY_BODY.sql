CREATE PACKAGE BODY PGARDBA.ASV_UTILITY
AS
   PROCEDURE tune_sql_by_spm (p_sql_id VARCHAR2)
   IS
      v_name_postix       VARCHAR2 (200);
      l_cursor            DBMS_SQLTUNE.sqlset_cursor;
      v_begin_snap        NUMBER;
      v_end_snap          NUMBER;
      l_plans_loaded      PLS_INTEGER;
      l_plans_altered     PLS_INTEGER;
      v_plan_hash_value   NUMBER;
      v_sql_handle        VARCHAR2 (128);
      v_plan_name         VARCHAR2 (128);
   BEGIN
      v_name_postix := TO_CHAR (SYSDATE, 'yyyymmddhh24mi') || '_' || p_sql_id;

      SELECT MIN (snap_id), MAX (snap_id)
        INTO v_begin_snap, v_end_snap
        FROM DBA_HIST_SNAPSHOT s, v$database d
       WHERE d.dbid = s.dbid AND s.BEGIN_INTERVAL_TIME > SYSDATE - 90;


      DBMS_SQLTUNE.create_sqlset (
         sqlset_name    => 'STS_' || v_name_postix,
         sqlset_owner   => 'PGARDBA',
         description    => 'STS_for_plan_change_' || v_name_postix);


      OPEN l_cursor FOR
         SELECT VALUE (p)
           FROM TABLE (DBMS_SQLTUNE.select_workload_repository (
                          begin_snap       => v_begin_snap,
                          end_snap         => v_end_snap,
                          basic_filter     => 'sql_id=''' || p_sql_id || '''',
                          attribute_list   => 'ALL')) p;

      DBMS_SQLTUNE.load_sqlset (sqlset_name       => 'STS_' || v_name_postix,
                                sqlset_owner      => 'PGARDBA',
                                populate_cursor   => l_cursor);

      --v_plan_hash_value:=1762367396 ;


      SELECT plan_hash_value
        INTO v_plan_hash_value
        FROM (  SELECT plan_hash_value,
                       ROUND (
                          MAX (
                               elapsed_time
                             / DECODE (executions, 0, 1, executions)),
                          2)
                          max_ela,
                       ROUND (
                          AVG (
                               elapsed_time
                             / DECODE (executions, 0, 1, executions)),
                          2)
                          avg_ela
                  FROM DBA_SQLSET_STATEMENTS
                 WHERE     sqlset_name = 'STS_' || v_name_postix
                       AND sql_id = p_sql_id
              GROUP BY plan_hash_value
              ORDER BY 2) t
       WHERE ROWNUM = 1;



      l_plans_loaded :=
         DBMS_SPM.LOAD_PLANS_FROM_SQLSET (
            sqlset_name    => 'STS_' || v_name_postix,
            sqlset_owner   => 'PGARDBA',
            basic_filter   =>    'sql_id='''
                              || p_sql_id
                              || ''' and plan_hash_value='
                              || v_plan_hash_value,
            FIXED          => 'YES');

      DBMS_OUTPUT.put_line (
            'DBMS_SPM.LOAD_PLANS_FROM_SQLSET_FIXED '
         || l_plans_loaded
         || '-'
         || 'plan_hash_value='
         || v_plan_hash_value);

      l_plans_loaded :=
         DBMS_SPM.LOAD_PLANS_FROM_SQLSET (
            sqlset_name    => 'STS_' || v_name_postix,
            sqlset_owner   => 'PGARDBA',
            basic_filter   =>    'sql_id='''
                              || p_sql_id
                              || ''' and plan_hash_value<>'
                              || v_plan_hash_value,
            FIXED          => 'NO',
            ENABLED        => 'NO');

      DBMS_OUTPUT.put_line (
            'DBMS_SPM.LOAD_PLANS_FROM_SQLSET_NOFIXED '
         || l_plans_loaded
         || '-'
         || 'plan_hash_value<>'
         || v_plan_hash_value);
   END;

   PROCEDURE tune_sql_by_spm2 (p_sql_id VARCHAR2, p_plan_hash_value NUMBER)
   IS
      v_name_postix       VARCHAR2 (200);
      l_cursor            DBMS_SQLTUNE.sqlset_cursor;
      v_begin_snap        NUMBER;
      v_end_snap          NUMBER;
      l_plans_loaded      PLS_INTEGER;
      l_plans_altered     PLS_INTEGER;
      v_plan_hash_value   NUMBER;
      v_sql_handle        VARCHAR2 (128);
      v_plan_name         VARCHAR2 (128);
   BEGIN
      v_plan_hash_value := p_plan_hash_value;
      v_name_postix := TO_CHAR (SYSDATE, 'yyyymmddhh24mi') || '_' || p_sql_id;

      SELECT MIN (snap_id), MAX (snap_id)
        INTO v_begin_snap, v_end_snap
        FROM DBA_HIST_SNAPSHOT s, v$database d
       WHERE d.dbid = s.dbid AND s.BEGIN_INTERVAL_TIME > SYSDATE - 90;


      DBMS_SQLTUNE.create_sqlset (
         sqlset_name    => 'STS_' || v_name_postix,
         sqlset_owner   => 'PGARDBA',
         description    => 'STS_for_plan_change_' || v_name_postix);


      OPEN l_cursor FOR
         SELECT VALUE (p)
           FROM TABLE (DBMS_SQLTUNE.select_workload_repository (
                          begin_snap       => v_begin_snap,
                          end_snap         => v_end_snap,
                          basic_filter     => 'sql_id=''' || p_sql_id || '''',
                          attribute_list   => 'ALL')) p;

      DBMS_SQLTUNE.load_sqlset (sqlset_name       => 'STS_' || v_name_postix,
                                sqlset_owner      => 'PGARDBA',
                                populate_cursor   => l_cursor);

      OPEN l_cursor FOR
         SELECT VALUE (p)
           FROM TABLE (
                   DBMS_SQLTUNE.SELECT_CURSOR_CACHE (
                      basic_filter     => 'sql_id=''' || p_sql_id || '''',
                      attribute_list   => 'ALL')) p;

      DBMS_SQLTUNE.load_sqlset (sqlset_name       => 'STS_' || v_name_postix,
                                sqlset_owner      => 'PGARDBA',
                                populate_cursor   => l_cursor);

      l_plans_loaded :=
         DBMS_SPM.LOAD_PLANS_FROM_SQLSET (
            sqlset_name    => 'STS_' || v_name_postix,
            sqlset_owner   => 'PGARDBA',
            basic_filter   =>    'sql_id='''
                              || p_sql_id
                              || ''' and plan_hash_value='
                              || v_plan_hash_value,
            FIXED          => 'YES');

      DBMS_OUTPUT.put_line (
            'DBMS_SPM.LOAD_PLANS_FROM_SQLSET_FIXED '
         || l_plans_loaded
         || '-'
         || 'plan_hash_value='
         || v_plan_hash_value);

      l_plans_loaded :=
         DBMS_SPM.LOAD_PLANS_FROM_SQLSET (
            sqlset_name    => 'STS_' || v_name_postix,
            sqlset_owner   => 'PGARDBA',
            basic_filter   =>    'sql_id='''
                              || p_sql_id
                              || ''' and plan_hash_value<>'
                              || v_plan_hash_value,
            FIXED          => 'NO',
            ENABLED        => 'NO');

      DBMS_OUTPUT.put_line (
            'DBMS_SPM.LOAD_PLANS_FROM_SQLSET_NOFIXED '
         || l_plans_loaded
         || '-'
         || 'plan_hash_value<>'
         || v_plan_hash_value);
   END;


   /*
   grant select on v_$database to pgardba ;
   grant select on DBA_HIST_SNAPSHOT to pgardba ;
   grant select on DBA_SQLSET_STATEMENTS  to pgardba ;
   grant ADMINISTER SQL TUNING SET to pgardba ;
   GRANT ADMINISTER SQL MANAGEMENT OBJECT to pgardba ;
   select 'grant select on '||table_name||' to pgardba with grant option;'
    from dict where table_name like 'DBA_HIST%'

   begin
   for s in (
   select * from dba_sqlset where name like 'STS_2017%' order by created desc
   )
   loop
   DBMS_SQLTUNE.drop_sqlset (sqlset_name  =>s.name,sqlset_owner=>s.owner);
   end loop;
   end;
   */

PROCEDURE ACT_SESHIST_FILLER
AS
   v_exist   INT := 0;
BEGIN
   EXECUTE IMMEDIATE
      'SELECT COUNT(1) FROM DBA_TABLES WHERE OWNER=''PGARDBA'' AND TABLE_NAME=''ASV_HIST_PERFORMANCE'''
      INTO v_exist;

   IF v_exist > 0
   THEN
      EXECUTE IMMEDIATE 'TRUNCATE TABLE PGARDBA.ASV_HIST_PERFORMANCE';
   ELSE
      EXECUTE IMMEDIATE
         'CREATE TABLE PGARDBA.ASV_HIST_PERFORMANCE COMPRESS FOR QUERY HIGH AS 
SELECT 
         SQL_IDENTIFIER,
         SQL_EXEC_ID,
         SQL_EXEC_START,
         SQL_PLAN_HASH_VALUE,
         ROUND (
              (MAX (CAST (SAMPLE_TIME AS DATE)) - MAX (SQL_EXEC_START))
            * 24
            * 60
            * 60)
            ELAPSED_SEC,
         COUNT (*) NUMBER_OF_SAMPLES
    FROM (SELECT CASE
                    WHEN FORCE_MATCHING_SIGNATURE = 0 THEN SQL_ID
                    ELSE TO_CHAR (FORCE_MATCHING_SIGNATURE)
                 END
                    SQL_IDENTIFIER,
                 SQL_EXEC_ID,
                 SAMPLE_TIME,
                 SQL_EXEC_START,
                 SQL_PLAN_HASH_VALUE,
                 SQL_ID,
                 FORCE_MATCHING_SIGNATURE
            FROM DBA_HIST_ACTIVE_SESS_HISTORY
           WHERE     SESSION_TYPE = ''FOREGROUND''
                 AND 1=2
                 AND SNAP_ID >=
                        (  SELECT MIN (SNAP_ID)
                             FROM DBA_HIST_SNAPSHOT S
                            WHERE S.BEGIN_INTERVAL_TIME >=
                                     ADD_MONTHS (TRUNC (SYSDATE, ''MM''), -3)
                         )
                 AND SQL_EXEC_ID IS NOT NULL)
GROUP BY SQL_IDENTIFIER,
         SQL_EXEC_ID,
         SQL_EXEC_START,
         SQL_PLAN_HASH_VALUE';
   END IF;


   EXECUTE IMMEDIATE
      'INSERT /*+APPEND ENABLE_PARALLEL_DML*/ INTO PGARDBA.ASV_HIST_PERFORMANCE 
SELECT /*+PARALLEL(8)*/
         SQL_IDENTIFIER,
         SQL_EXEC_ID,
         SQL_EXEC_START,
         SQL_PLAN_HASH_VALUE,
         ROUND (
              (MAX (CAST (SAMPLE_TIME AS DATE)) - MAX (SQL_EXEC_START))
            * 24
            * 60
            * 60)
            ELAPSED_SEC,
         COUNT (*) NUMBER_OF_SAMPLES
    FROM (SELECT CASE
                    WHEN FORCE_MATCHING_SIGNATURE = 0 THEN SQL_ID
                    ELSE TO_CHAR (FORCE_MATCHING_SIGNATURE)
                 END
                    SQL_IDENTIFIER,
                 SQL_EXEC_ID,
                 SAMPLE_TIME,
                 SQL_EXEC_START,
                 SQL_PLAN_HASH_VALUE,
                 SQL_ID,
                 FORCE_MATCHING_SIGNATURE
            FROM DBA_HIST_ACTIVE_SESS_HISTORY
           WHERE     SESSION_TYPE = ''FOREGROUND''
                 AND SNAP_ID >=
                        (  SELECT MIN (SNAP_ID)
                             FROM DBA_HIST_SNAPSHOT S
                            WHERE S.BEGIN_INTERVAL_TIME >=
                                     ADD_MONTHS (TRUNC (SYSDATE, ''MM''), -3)
                         )
                 AND SQL_EXEC_ID IS NOT NULL)
GROUP BY SQL_IDENTIFIER,
         SQL_EXEC_ID,
         SQL_EXEC_START,
         SQL_PLAN_HASH_VALUE';

   COMMIT;
END;
   
PROCEDURE SET_SQL_PROFILE (p_sql_id            IN VARCHAR2,
                                           p_plan_hash_value   IN NUMBER,
                                           p_force_match IN VARCHAR2)
AS
      v_other_xml CLOB;
      v_sql_text   CLOB;
      v_sql_text2   CLOB;
BEGIN

   -- get sql_text from memory
   DECLARE
      l_sql_text   VARCHAR2 (32767);

   BEGIN
      FOR i IN (  SELECT DISTINCT piece, sql_text
                    FROM SYS.gv_$sqltext_with_newlines
                   WHERE sql_id = TRIM (p_sql_id)
                ORDER BY 1, 2)
      LOOP
         IF v_sql_text IS NULL
         THEN
            DBMS_LOB.CREATETEMPORARY ( v_sql_text, TRUE);
            DBMS_LOB.OPEN ( v_sql_text, DBMS_LOB.LOB_READWRITE);
         END IF;

         -- removes NUL characters
         l_sql_text := REPLACE (i.sql_text, CHR (00), ' ');
         -- adds a NUL character at the end of each line
         DBMS_LOB.WRITEAPPEND ( v_sql_text,
                               LENGTH (l_sql_text) + 1,
                               l_sql_text || CHR (00));
      END LOOP;

      -- if found in memory then sql_text is not null
      IF v_sql_text IS NOT NULL
      THEN
         DBMS_LOB.CLOSE ( v_sql_text);
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         DBMS_OUTPUT.PUT_LINE ('getting sql_text from memory: ' || SQLERRM);
         v_sql_text := NULL;
   END;

    -- get sql_text from awr
    DECLARE
      l_sql_text VARCHAR2(32767);
      l_clob_size NUMBER;
      l_offset NUMBER;
    BEGIN
      IF v_sql_text IS NULL OR NVL(DBMS_LOB.GETLENGTH(v_sql_text), 0) = 0 THEN
        SELECT sql_text
          INTO v_sql_text2
          FROM dba_hist_sqltext
         WHERE sql_id = TRIM(p_sql_id)
           AND sql_text IS NOT NULL
           AND ROWNUM = 1;
      END IF;
      -- if found in awr then sql_text2 is not null
      IF v_sql_text2 IS NOT NULL THEN
        l_clob_size := NVL(DBMS_LOB.GETLENGTH(v_sql_text2), 0);
        l_offset := 1;
        DBMS_LOB.CREATETEMPORARY(v_sql_text, TRUE);
        DBMS_LOB.OPEN(v_sql_text, DBMS_LOB.LOB_READWRITE);
        -- store in clob as 64 character pieces plus a NUL character at the end of each piece
        WHILE l_offset < l_clob_size
        LOOP
          IF l_clob_size - l_offset > 64 THEN
            l_sql_text := REPLACE(DBMS_LOB.SUBSTR(v_sql_text2, 64, l_offset), CHR(00), ' ');
          ELSE -- last piece
            l_sql_text := REPLACE(DBMS_LOB.SUBSTR(v_sql_text2, l_clob_size - l_offset + 1, l_offset), CHR(00), ' ');
          END IF;
          DBMS_LOB.WRITEAPPEND(v_sql_text, LENGTH(l_sql_text) + 1, l_sql_text||CHR(00));
          l_offset := l_offset + 64;
        END LOOP;
        DBMS_LOB.CLOSE(v_sql_text);
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('getting sql_text from awr: '||SQLERRM);
        v_sql_text := NULL;
    END;

    BEGIN
      IF v_sql_text IS NULL THEN
        RAISE_APPLICATION_ERROR(-20100, 'SQL_TEXT for SQL_ID '||p_sql_id||'. was not found in memory (gv$sqltext_with_newlines) or AWR (dba_hi
    st_sqltext).');
      END IF;
    END;

    -- get other_xml from memory
    BEGIN
      FOR i IN (SELECT other_xml
                  FROM gv$sql_plan
                 WHERE sql_id = TRIM(p_sql_id)
                   AND plan_hash_value = TO_NUMBER(TRIM(p_plan_hash_value))
                   AND other_xml IS NOT NULL
                 ORDER BY
                       child_number, id)
      LOOP
        v_other_xml := i.other_xml;
        EXIT; -- 1st
      END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('getting other_xml from memory: '||SQLERRM);
        v_other_xml := NULL;
    END;

    -- get other_xml from awr
    BEGIN
      IF v_other_xml IS NULL OR NVL(DBMS_LOB.GETLENGTH(v_other_xml), 0) = 0 THEN
        FOR i IN (SELECT other_xml
                    FROM dba_hist_sql_plan
                   WHERE sql_id = TRIM(p_sql_id)
                     AND plan_hash_value = TO_NUMBER(TRIM(p_plan_hash_value))
                     AND other_xml IS NOT NULL
                   ORDER BY
                         id)
        LOOP
          v_other_xml := i.other_xml;
          EXIT; -- 1st
        END LOOP;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('getting other_xml from awr: '||SQLERRM);
        v_other_xml := NULL;
    END;

    -- get other_xml from memory from modified SQL
    BEGIN
      IF v_other_xml IS NULL OR NVL(DBMS_LOB.GETLENGTH(v_other_xml), 0) = 0 THEN
        FOR i IN (SELECT other_xml
                    FROM gv$sql_plan
                   WHERE plan_hash_value = TO_NUMBER(TRIM(p_plan_hash_value))
                     AND other_xml IS NOT NULL
                   ORDER BY
                         child_number, id)
        LOOP
          v_other_xml := i.other_xml;
          EXIT; -- 1st
        END LOOP;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('getting other_xml from memory: '||SQLERRM);
        v_other_xml := NULL;
    END;

    -- get other_xml from awr from modified SQL
    BEGIN
      IF v_other_xml IS NULL OR NVL(DBMS_LOB.GETLENGTH(v_other_xml), 0) = 0 THEN
        FOR i IN (SELECT other_xml
                    FROM dba_hist_sql_plan
                   WHERE plan_hash_value = TO_NUMBER(TRIM(p_plan_hash_value))
                     AND other_xml IS NOT NULL
                   ORDER BY
                         id)
        LOOP
          v_other_xml := i.other_xml;
          EXIT; -- 1st
        END LOOP;
      END IF;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('getting other_xml from awr: '||SQLERRM);
        v_other_xml := NULL;
    END;

    -- validate other_xml

    BEGIN
      IF v_other_xml IS NULL THEN
        RAISE_APPLICATION_ERROR(-20101, 'PLAN for SQL_ID '||p_sql_id||' and PHV '||p_plan_hash_value||' was not found in memory (gv$sql_plan) or A
    WR (dba_hist_sql_plan).');
      END IF;
    END;

    DECLARE
      l_pos NUMBER;
      l_clob_size NUMBER;
      l_offset NUMBER;
      l_sql_text VARCHAR2(32767);
      l_len NUMBER;
      l_hint VARCHAR2(32767);
      v_profile_sql clob;
    BEGIN

      v_profile_sql:='DECLARE
sql_txt CLOB;
h       SYS.SQLPROF_ATTR;
signature number;
signaturef number;
PROCEDURE wa (p_line IN VARCHAR2) IS
BEGIN
DBMS_LOB.WRITEAPPEND(sql_txt, LENGTH(p_line), p_line);
END wa;
BEGIN
DBMS_LOB.CREATETEMPORARY(sql_txt, TRUE);
DBMS_LOB.OPEN(sql_txt, DBMS_LOB.LOB_READWRITE);
-- SQL Text pieces below do not have to be of same length.
-- So if you edit SQL Text (i.e. removing temporary Hints),
-- there is no need to edit or re-align unmodified pieces.';

      l_clob_size := NVL(DBMS_LOB.GETLENGTH(v_sql_text), 0);
      l_offset := 1;
      WHILE l_offset < l_clob_size
      LOOP
        l_pos := DBMS_LOB.INSTR(v_sql_text, CHR(00), l_offset);
        IF l_pos > 0 THEN
          l_len := l_pos - l_offset;
        ELSE -- last piece
          l_len := l_clob_size - l_pos + 1;
        END IF;
        l_sql_text := DBMS_LOB.SUBSTR(v_sql_text, l_len, l_offset);
        /* cannot do such 3 replacement since a line could end with a comment using "--"
        l_sql_text := REPLACE(l_sql_text, CHR(10), ' '); -- replace LF with SP
        l_sql_text := REPLACE(l_sql_text, CHR(13), ' '); -- replace CR with SP
        l_sql_text := REPLACE(l_sql_text, CHR(09), ' '); -- replace TAB with SP
        */
        l_offset := l_offset + l_len + 1;
        IF l_len > 0 THEN
          IF INSTR(l_sql_text, '''[') + INSTR(l_sql_text, ']''') = 0 THEN
            l_sql_text := '['||l_sql_text||']';
          ELSIF INSTR(l_sql_text, '''{') + INSTR(l_sql_text, '}''') = 0 THEN
            l_sql_text := '{'||l_sql_text||'}';
          ELSIF INSTR(l_sql_text, '''<') + INSTR(l_sql_text, '>''') = 0 THEN
            l_sql_text := '<'||l_sql_text||'>';
          ELSIF INSTR(l_sql_text, '''(') + INSTR(l_sql_text, ')''') = 0 THEN
            l_sql_text := '('||l_sql_text||')';
          ELSIF INSTR(l_sql_text, '''"') + INSTR(l_sql_text, '"''') = 0 THEN
            l_sql_text := '"'||l_sql_text||'"';
          ELSIF INSTR(l_sql_text, '''|') + INSTR(l_sql_text, '|''') = 0 THEN
            l_sql_text := '|'||l_sql_text||'|';
          ELSIF INSTR(l_sql_text, '''~') + INSTR(l_sql_text, '~''') = 0 THEN
            l_sql_text := '~'||l_sql_text||'~';
          ELSIF INSTR(l_sql_text, '''^') + INSTR(l_sql_text, '^''') = 0 THEN
            l_sql_text := '^'||l_sql_text||'^';
          ELSIF INSTR(l_sql_text, '''@') + INSTR(l_sql_text, '@''') = 0 THEN
            l_sql_text := '@'||l_sql_text||'@';
          ELSIF INSTR(l_sql_text, '''#') + INSTR(l_sql_text, '#''') = 0 THEN
            l_sql_text := '#'||l_sql_text||'#';
          ELSIF INSTR(l_sql_text, '''%') + INSTR(l_sql_text, '%''') = 0 THEN
            l_sql_text := '%'||l_sql_text||'%';
          ELSIF INSTR(l_sql_text, '''$') + INSTR(l_sql_text, '$''') = 0 THEN
            l_sql_text := '$'||l_sql_text||'$';
          ELSE
            l_sql_text := CHR(96)||l_sql_text||CHR(96);
          END IF;
          v_profile_sql:=v_profile_sql||'
wa(q'''||l_sql_text||''');';
        END IF;
      END LOOP;
      v_profile_sql:=v_profile_sql||'
DBMS_LOB.CLOSE(sql_txt);
h := SYS.SQLPROF_ATTR(
q''[BEGIN_OUTLINE_DATA]'',';
      FOR i IN (SELECT /*+ opt_param('parallel_execution_enabled', 'false') */
                       SUBSTR(EXTRACTVALUE(VALUE(d), '/hint'), 1, 4000) hint
                  FROM TABLE(XMLSEQUENCE(EXTRACT(XMLTYPE(v_other_xml), '/*/outline_data/hint'))) d)
      LOOP
        l_hint := i.hint;
        WHILE NVL(LENGTH(l_hint), 0) > 0
        LOOP
          IF LENGTH(l_hint) <= 500 THEN
          v_profile_sql:=v_profile_sql||'
q''['||l_hint||']'',';
            l_hint := NULL;
          ELSE
            l_pos := INSTR(SUBSTR(l_hint, 1, 500), ' ', -1);
            v_profile_sql:=v_profile_sql||'
q''['||SUBSTR(l_hint, 1, l_pos)||']'',';
            l_hint := '   '||SUBSTR(l_hint, l_pos);
          END IF;
        END LOOP;
      END LOOP;

      v_profile_sql:=v_profile_sql||'
q''[END_OUTLINE_DATA]'');
signature := DBMS_SQLTUNE.SQLTEXT_TO_SIGNATURE(sql_txt);
signaturef := DBMS_SQLTUNE.SQLTEXT_TO_SIGNATURE(sql_txt, TRUE);
DBMS_SQLTUNE.IMPORT_SQL_PROFILE (
sql_text    => sql_txt,
profile     => h,
name        => ''coe_'||p_sql_id||'_'||TO_CHAR(p_plan_hash_value)||''',
description => ''coe '||p_sql_id||'_'||TO_CHAR(p_plan_hash_value)||' ''||signature||'' ''||signaturef||'''',
category    => ''DEFAULT'',
validate    => TRUE,
replace     => TRUE,
force_match => '||p_force_match||' /* TRUE:FORCE (match even when different literals in SQL). FALSE:EXACT (similar to CURSOR_SHARING) */);
DBMS_LOB.FREETEMPORARY(sql_txt);
END;';

    EXECUTE IMMEDIATE v_profile_sql;

    END;
    
END;

FUNCTION PLAN_PARSER (
   p_sql_id            IN VARCHAR2,
   p_plan_hash_value   IN NUMBER)
   RETURN VARCHAR2
IS
   r_plan   VARCHAR2 (4000);
BEGIN
   --Cursor Cache'te varsa al
   SELECT LISTAGG (SP.SQL_PLAN_SUMMARY) WITHIN GROUP (ORDER BY SP.ID)
     INTO r_plan
     FROM (SELECT SORGU.*,
                  CASE
                     --JOINLER
                     WHEN OPERATION IN ('HASH JOIN',
                                        'MERGE JOIN',
                                        'NESTED LOOPS')
                     THEN
                        OPERATION || ' ' || OPTIONS || ' ('
                     --JOIN'DEKÝ ÝLK TABLO
                     WHEN     OPERATION NOT IN ('HASH JOIN',
                                                'MERGE JOIN',
                                                'NESTED LOOPS')
                          AND PRE_OPERATION IN ('HASH JOIN',
                                                'MERGE JOIN',
                                                'NESTED LOOPS')
                     THEN
                        LOWER (OBJECT_NAME) || ', '
                     --EÐER ARKA ARKAYA GELEN ÝLK ÝKÝLÝ TABLO GRUBU ÝSE
                     WHEN     OPERATION NOT IN ('HASH JOIN',
                                                'MERGE JOIN',
                                                'NESTED LOOPS')
                          AND PRE_OPERATION NOT IN ('HASH JOIN',
                                                    'MERGE JOIN',
                                                    'NESTED LOOPS')
                          AND PRE2_OPERATION IN ('HASH JOIN',
                                                 'MERGE JOIN',
                                                 'NESTED LOOPS')
                     THEN
                        CASE
                           WHEN NEXT_OPERATION IS NULL /*AYNI ZAMANDA SON MU*/
                           THEN
                              CASE
                                 WHEN PRE3_OPERATION IS NULL /*AYNI ZAMANDA TEK JOIN MI*/
                                 THEN
                                    LOWER (OBJECT_NAME) || ')'
                                 ELSE
                                    LOWER (OBJECT_NAME) || '))'
                              END
                           ELSE
                              LOWER (OBJECT_NAME) || '), '
                        END
                     --SON TABLO ÝSE
                     WHEN NEXT_OPERATION IS NULL
                     THEN
                        CASE
                           WHEN PRE_OPERATION IS NULL
                           THEN
                              LOWER (OBJECT_NAME)
                           ELSE
                              LOWER (OBJECT_NAME) || ')'
                        END
                     ELSE
                        CASE
                           WHEN PRE_OPERATION IS NULL
                           THEN
                              LOWER (OBJECT_NAME)
                           ELSE
                              LOWER (OBJECT_NAME) || '), '
                        END
                  END
                     SQL_PLAN_SUMMARY
             FROM (SELECT PLAN_HASH_VALUE,
                          SQL_ID,
                          ID,
                          OPERATION,
                          OPTIONS,
                          OBJECT_OWNER,
                          OBJECT_NAME,
                          LAG (OPERATION, 1)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                             PRE_OPERATION,
                          LAG (OPERATION, 2)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                             PRE2_OPERATION,
                          LAG (OPERATION, 3)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                             PRE3_OPERATION,
                          LEAD (OPERATION, 1)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                             NEXT_OPERATION
                     FROM (  SELECT PLAN_HASH_VALUE,
                                    SQL_ID,
                                    ID,
                                    OPERATION,
                                    OPTIONS,
                                    OBJECT_OWNER,
                                    OBJECT_NAME
                               FROM GV$SQL_PLAN S
                              WHERE     S.SQL_ID = p_sql_id
                                    AND S.PLAN_HASH_VALUE = p_plan_hash_value
                                    AND S.CHILD_NUMBER = 0
                                    AND (   S.OPERATION IN ('EXTERNAL TABLE ACCESS',
                                                            'HASH JOIN',
                                                            'MERGE JOIN',
                                                            'NESTED LOOPS')
                                         OR (    S.OBJECT_NAME IS NOT NULL
                                             AND S.OBJECT_NAME NOT LIKE ':%'
                                             AND S.OPERATION LIKE 'TABLE%'))
                           --Bu group by GV$SQL_PLAN'daki INST_ID çoklamasýndan
                           GROUP BY PLAN_HASH_VALUE,
                                    SQL_ID,
                                    ID,
                                    OPERATION,
                                    OPTIONS,
                                    OBJECT_OWNER,
                                    OBJECT_NAME)) SORGU) SP;

   --Cursor Cache'te yoksa AWR
   IF r_plan IS NULL
   THEN
      SELECT LISTAGG (SP.SQL_PLAN_SUMMARY) WITHIN GROUP (ORDER BY SP.ID)
        INTO r_plan
        FROM (SELECT SORGU.*,
                     CASE
                        --JOINLER
                        WHEN OPERATION IN ('HASH JOIN',
                                           'MERGE JOIN',
                                           'NESTED LOOPS')
                        THEN
                           OPERATION || ' ' || OPTIONS || ' ('
                        --JOIN'DEKÝ ÝLK TABLO
                        WHEN     OPERATION NOT IN ('HASH JOIN',
                                                   'MERGE JOIN',
                                                   'NESTED LOOPS')
                             AND PRE_OPERATION IN ('HASH JOIN',
                                                   'MERGE JOIN',
                                                   'NESTED LOOPS')
                        THEN
                           LOWER (OBJECT_NAME) || ', '
                        --EÐER ARKA ARKAYA GELEN ÝLK ÝKÝLÝ TABLO GRUBU ÝSE
                        WHEN     OPERATION NOT IN ('HASH JOIN',
                                                   'MERGE JOIN',
                                                   'NESTED LOOPS')
                             AND PRE_OPERATION NOT IN ('HASH JOIN',
                                                       'MERGE JOIN',
                                                       'NESTED LOOPS')
                             AND PRE2_OPERATION IN ('HASH JOIN',
                                                    'MERGE JOIN',
                                                    'NESTED LOOPS')
                        THEN
                           CASE
                              WHEN NEXT_OPERATION IS NULL /*AYNI ZAMANDA SON MU*/
                              THEN
                                 CASE
                                    WHEN PRE3_OPERATION IS NULL /*AYNI ZAMANDA TEK JOIN MI*/
                                    THEN
                                       LOWER (OBJECT_NAME) || ')'
                                    ELSE
                                       LOWER (OBJECT_NAME) || '))'
                                 END
                              ELSE
                                 LOWER (OBJECT_NAME) || '), '
                           END
                        --SON TABLO ÝSE
                        WHEN NEXT_OPERATION IS NULL
                        THEN
                           CASE
                              WHEN PRE_OPERATION IS NULL
                              THEN
                                 LOWER (OBJECT_NAME)
                              ELSE
                                 LOWER (OBJECT_NAME) || ')'
                           END
                        ELSE
                           CASE
                              WHEN PRE_OPERATION IS NULL
                              THEN
                                 LOWER (OBJECT_NAME)
                              ELSE
                                 LOWER (OBJECT_NAME) || '), '
                           END
                     END
                        SQL_PLAN_SUMMARY
                FROM (SELECT PLAN_HASH_VALUE,
                             SQL_ID,
                             ID,
                             OPERATION,
                             OPTIONS,
                             OBJECT_OWNER,
                             OBJECT_NAME,
                             LAG (OPERATION, 1)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                                PRE_OPERATION,
                             LAG (OPERATION, 2)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                                PRE2_OPERATION,
                             LAG (OPERATION, 3)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                                PRE3_OPERATION,
                             LEAD (OPERATION, 1)
                             OVER (PARTITION BY PLAN_HASH_VALUE ORDER BY ID)
                                NEXT_OPERATION
                        FROM (  SELECT PLAN_HASH_VALUE,
                                       SQL_ID,
                                       ID,
                                       OPERATION,
                                       OPTIONS,
                                       OBJECT_OWNER,
                                       OBJECT_NAME
                                  FROM DBA_HIST_SQL_PLAN S
                                 WHERE     S.SQL_ID = p_sql_id
                                       AND S.PLAN_HASH_VALUE =
                                              p_plan_hash_value
                                       AND (   S.OPERATION IN ('EXTERNAL TABLE ACCESS',
                                                               'HASH JOIN',
                                                               'MERGE JOIN',
                                                               'NESTED LOOPS')
                                            OR (    S.OBJECT_NAME IS NOT NULL
                                                AND S.OBJECT_NAME NOT LIKE ':%'
                                                AND S.OPERATION LIKE 'TABLE%'))
                              --Bu group by GV$SQL_PLAN'daki INST_ID çoklamasýndan
                              GROUP BY PLAN_HASH_VALUE,
                                       SQL_ID,
                                       ID,
                                       OPERATION,
                                       OPTIONS,
                                       OBJECT_OWNER,
                                       OBJECT_NAME)) SORGU) SP;
   END IF;

   RETURN r_plan;
END;

END;
/

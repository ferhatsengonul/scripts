CREATE VIEW PGARDBA.ASV_HISTORIC_SQL_PERF_VW
AS
   WITH ALLTAB
        AS (  SELECT    MAX (GS.USERNAME)
                     || '_'
                     || MAX (OSUSER)
                     || '_'
                     || MAX (SID)
                        USERNAME,
                     MIN (GS.SQL_EXEC_START) ACTUAL_START,
                     T1.SQL_ID,
                     T1.SQL_EXEC_START SQL_EXEC_START_PREV,
                     T1.SQL_EXEC_START_MAX,
                     T1.SQL_IDENTIFIER,
                     T1.ELAPSED_SEC ELAPSED_SEC_PREV,
                     T1.ELAPSED_SEC_MAX,
                     ROUND (
                        (SYSDATE - MIN (GS.SQL_EXEC_START)) * 24 * 60 * 60)
                        ACTUAL_RUN,
                       ROUND (
                          (SYSDATE - MIN (GS.SQL_EXEC_START)) * 24 * 60 * 60)
                     - T1.ELAPSED_SEC
                        DIFF,
                     T1.PREVIOUS_PLAN PREV_PLAN,
                     T1.PREVIOUS_PLAN_MAX PREV_PLAN_MAX,
                     T1.ACTUAL_PLAN
                FROM (SELECT ACT_SQL.SQL_ID,
                             ACT_SQL.SQL_IDENTIFIER,
                             AHP_LAST_RUN.SQL_EXEC_START,
                             AHP_LAST_RUN.ELAPSED_SEC,
                             AHP_LAST_RUN.SQL_PLAN_HASH_VALUE PREVIOUS_PLAN,
                             AHP_MAX_RUN.SQL_EXEC_START SQL_EXEC_START_MAX,
                             AHP_MAX_RUN.ELAPSED_SEC ELAPSED_SEC_MAX,
                             AHP_MAX_RUN.SQL_PLAN_HASH_VALUE PREVIOUS_PLAN_MAX,
                             ACT_SQL.ACTUAL_PLAN
                        FROM (SELECT *
                                FROM (SELECT ASLAST.*,
                                             RANK ()
                                             OVER (
                                                PARTITION BY SQL_IDENTIFIER
                                                ORDER BY
                                                   SQL_EXEC_START DESC,
                                                   SQL_EXEC_ID DESC)
                                                SIRA
                                        FROM PGARDBA.ASV_HIST_PERFORMANCE ASLAST)
                               WHERE SIRA = 1) AHP_LAST_RUN,
                             (SELECT *
                                FROM (SELECT ASMAX.*,
                                             RANK ()
                                             OVER (
                                                PARTITION BY SQL_IDENTIFIER
                                                ORDER BY
                                                   ELAPSED_SEC DESC,
                                                   SQL_EXEC_START DESC)
                                                SIRA
                                        FROM PGARDBA.ASV_HIST_PERFORMANCE ASMAX)
                               WHERE SIRA = 1) AHP_MAX_RUN,
                             (SELECT DISTINCT
                                     CASE
                                        WHEN FORCE_MATCHING_SIGNATURE = 0
                                        THEN
                                           SQL_ID
                                        ELSE
                                           TO_CHAR (FORCE_MATCHING_SIGNATURE)
                                     END
                                        SQL_IDENTIFIER,
                                     SQL_ID,
                                     SQL_PLAN_HASH_VALUE ACTUAL_PLAN
                                FROM GV$ACTIVE_SESSION_HISTORY
                               WHERE     SAMPLE_TIME >
                                            SYSDATE - 10 / 24 / 60 / 60
                                     AND SESSION_TYPE = 'FOREGROUND'
                                     AND SQL_ID IS NOT NULL) ACT_SQL
                       WHERE     ACT_SQL.SQL_IDENTIFIER =
                                    AHP_LAST_RUN.SQL_IDENTIFIER(+)
                             AND ACT_SQL.SQL_IDENTIFIER =
                                    AHP_MAX_RUN.SQL_IDENTIFIER(+)) T1,
                     GV$SESSION GS
               WHERE     T1.SQL_ID(+) = GS.SQL_ID
                     AND GS.STATUS = 'ACTIVE'
                     AND TYPE = 'USER'
                     AND NVL (PROGRAM, 'abc') NOT LIKE
                            'oracle@gbxd%.fw.garanti.com.tr (%'
                     AND GS.SQL_EXEC_START IS NOT NULL
            GROUP BY T1.SQL_ID,
                     T1.SQL_EXEC_START,
                     T1.SQL_IDENTIFIER,
                     T1.ELAPSED_SEC,
                     T1.PREVIOUS_PLAN,
                     T1.ACTUAL_PLAN,
                     T1.SQL_EXEC_START_MAX,
                     T1.ELAPSED_SEC_MAX,
                     T1.PREVIOUS_PLAN_MAX)
     SELECT CASE
               WHEN     ACTUAL_RUN >
                             ELAPSED_SEC_PREV
                           * CASE
                                WHEN ELAPSED_SEC_PREV < 60 THEN 10
                                WHEN ELAPSED_SEC_PREV < 180 THEN 5
                                WHEN ELAPSED_SEC_PREV < 600 THEN 2
                                WHEN ELAPSED_SEC_PREV < 1800 THEN 1.5
                                WHEN ELAPSED_SEC_PREV < 3600 THEN 1.2
                                ELSE 1.1
                             END
                    AND ACTUAL_PLAN <> PREV_PLAN
               THEN
                  '1.MÜDAHELE - PLAN ÝNCELE'
               WHEN ELAPSED_SEC_PREV >= 300 AND ACTUAL_PLAN <> PREV_PLAN
               THEN
                  '2.PROAKTÝF - PLAN ÝNCELE'
               WHEN     ACTUAL_RUN > ELAPSED_SEC_PREV * 1.1
                    AND ACTUAL_PLAN = PREV_PLAN
               THEN
                  '3.AYNI PLAN YAVAÞ'
               WHEN ACTUAL_PLAN = PREV_PLAN
               THEN
                  '4.ÖNEMSÝZ - AYNI PLAN'
               ELSE
                  '5.ÖNEMSÝZ'
            END
               AKSIYON,
            ALLTAB.*,
            CASE
               WHEN PREV_PLAN <> ACTUAL_PLAN
               THEN
                  PGARDBA.ASV_UTILITY.PLAN_PARSER (SQL_ID, PREV_PLAN)
            END
               PREV_PLAN_DETAIL,
            PGARDBA.ASV_UTILITY.PLAN_PARSER (SQL_ID, ACTUAL_PLAN)
               ACTUAL_PLAN_DETAIL
       FROM ALLTAB
   ORDER BY AKSIYON, DIFF DESC;

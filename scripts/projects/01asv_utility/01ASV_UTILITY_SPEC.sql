CREATE PACKAGE PGARDBA.asv_utility
AS
   PROCEDURE tune_sql_by_spm (p_sql_id VARCHAR2);

   PROCEDURE tune_sql_by_spm2 (p_sql_id VARCHAR2, p_plan_hash_value NUMBER);

   PROCEDURE ACT_SESHIST_FILLER;

   PROCEDURE SET_SQL_PROFILE (p_sql_id            IN VARCHAR2,
                              p_plan_hash_value   IN NUMBER,
                              p_force_match       IN VARCHAR2);

   FUNCTION PLAN_PARSER (p_sql_id IN VARCHAR2, p_plan_hash_value IN NUMBER)
      RETURN VARCHAR2;
END;
/

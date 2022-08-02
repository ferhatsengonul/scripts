     SELECT /*+ NO_GBY_PUSHDOWN */ TST_IRDM_G01_ODBL_CUST_1.IP_ID,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('31.03.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '01.04.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '23.04.2018',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('31.03.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '01.04.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '23.04.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('24.03.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '25.03.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '23.04.2018',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('24.03.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '25.03.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '23.04.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('22.02.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '23.02.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '24.03.2018',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('22.02.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '23.02.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '24.03.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('23.01.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '24.01.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '22.02.2018',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('23.01.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '24.01.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '22.02.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('24.12.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '25.12.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '23.01.2018',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('24.12.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '25.12.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '23.01.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('24.11.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '25.11.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '24.12.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('24.11.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '25.11.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '24.12.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('25.10.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '26.10.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '24.11.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('25.10.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '26.10.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '24.11.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('25.09.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '26.09.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '25.10.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('25.09.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '26.09.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '25.10.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('26.08.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '27.08.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '25.09.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('26.08.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '27.08.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '25.09.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('27.07.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '28.07.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '26.08.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('27.07.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '28.07.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '26.08.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('27.06.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '28.06.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '27.07.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('27.06.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '28.06.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '27.07.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('28.05.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '29.05.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '27.06.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('28.05.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '29.05.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '27.06.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('28.04.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '29.04.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '28.05.2017',
                                                                                   'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)) < 0
               THEN
                  0
               ELSE
                  (  SUM (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                   TO_DATE ('28.04.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '29.04.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '28.05.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('31.03.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('23.04.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('24.03.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('22.02.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('23.01.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('24.12.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('24.11.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('25.10.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('25.09.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('26.08.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('27.07.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('27.06.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('28.05.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('28.04.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('23.04.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '01.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '01.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '23.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '23.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '24.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '22.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '24.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '22.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.10.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.11.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.10.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.11.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.09.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.10.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.09.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.10.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '27.08.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.09.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '27.08.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.09.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.07.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '26.08.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.07.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '26.08.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.06.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.07.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.06.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.07.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.05.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.06.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.05.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.06.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.04.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '28.05.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.04.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '28.05.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '23.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '23.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '24.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '22.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '24.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '22.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '23.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '25.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.10.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.11.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.10.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '24.11.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.09.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.10.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '26.09.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.10.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '27.08.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.09.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '27.08.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '25.09.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.07.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '26.08.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.07.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '26.08.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.06.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.07.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '28.06.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.07.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.05.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.06.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.05.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '27.06.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.04.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '28.05.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '29.04.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '28.05.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '31.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 30
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 60
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 90
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 120
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 150
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 180
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 210
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 240
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 270
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 300
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('23.04.2018', 'DD.MM.YYYY') - 330
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('23.04.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '26.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '27.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '25.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '26.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '30.03.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.04.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '28.02.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '29.03.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '29.01.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '27.02.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '30.12.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '28.01.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '30.11.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '29.12.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '31.10.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '29.11.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '01.10.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '30.10.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '01.09.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '30.09.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '02.08.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '31.08.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '03.07.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '01.08.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '03.06.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '02.07.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '04.05.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '02.06.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END))
       FROM PGARSTG.TST_IRDM_G01_ODBL_CUST_SIL 
       partition(SYS_P705824) 
       TST_IRDM_G01_ODBL_CUST_1 
      WHERE (1 = 1) AND (TST_IRDM_G01_ODBL_CUST_1.IP_ID > 0)
   GROUP BY TST_IRDM_G01_ODBL_CUST_1.IP_ID;
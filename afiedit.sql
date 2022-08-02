INSERT /*+ append */
      INTO  PGARSTG.TST_IRDM_G01_ODBL_SUMM_F (IP_ID,
                                            PAYD,
                                            PAY1,
                                            PAY2,
                                            PAY3,
                                            PAY4,
                                            PAY5,
                                            PAY6,
                                            PAY7,
                                            PAY8,
                                            PAY9,
                                            PAY10,
                                            PAY11,
                                            PAY12,
                                            BALD,
                                            BAL0,
                                            BAL1,
                                            BAL2,
                                            BAL3,
                                            BAL4,
                                            BAL5,
                                            BAL6,
                                            BAL7,
                                            BAL8,
                                            BAL9,
                                            BAL10,
                                            BAL11,
                                            BAL12,
                                            LIM0,
                                            LIM1,
                                            LIM2,
                                            LIM3,
                                            LIM4,
                                            LIM5,
                                            LIM6,
                                            LIM7,
                                            LIM8,
                                            LIM9,
                                            LIM10,
                                            LIM11,
                                            LIM12,
                                            CSHD,
                                            CSH1,
                                            CSH2,
                                            CSH3,
                                            CSH4,
                                            CSH5,
                                            CSH6,
                                            CSH7,
                                            CSH8,
                                            CSH9,
                                            CSH10,
                                            CSH11,
                                            CSH12,
                                            PAIDD,
                                            PAID1,
                                            PAID2,
                                            PAID3,
                                            PAID4,
                                            PAID5,
                                            PAID6,
                                            PAID7,
                                            PAID8,
                                            PAID9,
                                            PAID10,
                                            PAID11,
                                            PAID12,
                                            CSH_NUMD,
                                            CSH_NUM1,
                                            CSH_NUM2,
                                            CSH_NUM3,
                                            CSH_NUM4,
                                            CSH_NUM5,
                                            CSH_NUM6,
                                            CSH_NUM7,
                                            CSH_NUM8,
                                            CSH_NUM9,
                                            CSH_NUM10,
                                            CSH_NUM11,
                                            CSH_NUM12,
                                            PAID_NUMD,
                                            PAID_NUM1,
                                            PAID_NUM2,
                                            PAID_NUM3,
                                            PAID_NUM4,
                                            PAID_NUM5,
                                            PAID_NUM6,
                                            PAID_NUM7,
                                            PAID_NUM8,
                                            PAID_NUM9,
                                            PAID_NUM10,
                                            PAID_NUM11,
                                            PAID_NUM12,
                                            ROLLD,
                                            ROLL1,
                                            ROLL2,
                                            ROLL3,
                                            ROLL4,
                                            ROLL5,
                                            ROLL6,
                                            ROLL7,
                                            ROLL8,
                                            ROLL9,
                                            ROLL10,
                                            ROLL11,
                                            ROLL12,
                                            OPEN_FLG1,
                                            OPEN_FLG2,
                                            OPEN_FLG3,
                                            OPEN_FLG4,
                                            OPEN_FLG5,
                                            OPEN_FLG6,
                                            OPEN_FLG7,
                                            OPEN_FLG8,
                                            OPEN_FLG9,
                                            OPEN_FLG10,
                                            OPEN_FLG11,
                                            OPEN_FLG12,
                                            MAX_PAID1,
                                            MAX_PAID2,
                                            MAX_PAID3,
                                            MAX_PAID4,
                                            MAX_PAID5,
                                            MAX_PAID6,
                                            MAX_PAID7,
                                            MAX_PAID8,
                                            MAX_PAID9,
                                            MAX_PAID10,
                                            MAX_PAID11,
                                            MAX_PAID12,
                                            MAX_CSH0,
                                            MAX_CSH1,
                                            MAX_CSH2,
                                            MAX_CSH3,
                                            MAX_CSH4,
                                            MAX_CSH5,
                                            MAX_CSH6,
                                            MAX_CSH7,
                                            MAX_CSH8,
                                            MAX_CSH9,
                                            MAX_CSH10,
                                            MAX_CSH11,
                                            MAX_CSH12,
                                            CSH13,
                                            CSH14,
                                            CSH15,
                                            CSH16,
                                            CSH17,
                                            CSH18,
                                            CSH19,
                                            CSH20,
                                            CSH21,
                                            CSH22,
                                            CSH23,
                                            CSH24)
     SELECT TST_IRDM_G01_ODBL_CUST_1.IP_ID,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('31.10.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '01.11.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '14.11.2018',
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
                                   TO_DATE ('31.10.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '01.11.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '14.11.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('15.10.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '16.10.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '14.11.2018',
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
                                   TO_DATE ('15.10.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '16.10.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '14.11.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('15.09.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '16.09.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '15.10.2018',
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
                                   TO_DATE ('15.09.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '16.09.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '15.10.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('16.08.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '17.08.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '15.09.2018',
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
                                   TO_DATE ('16.08.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '17.08.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '15.09.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('17.07.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '18.07.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '16.08.2018',
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
                                   TO_DATE ('17.07.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '18.07.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '16.08.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('17.06.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '18.06.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '17.07.2018',
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
                                   TO_DATE ('17.06.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '18.06.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '17.07.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('18.05.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '19.05.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '17.06.2018',
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
                                   TO_DATE ('18.05.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '19.05.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '17.06.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('18.04.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '19.04.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '18.05.2018',
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
                                   TO_DATE ('18.04.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '19.04.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '18.05.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('19.03.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '20.03.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '18.04.2018',
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
                                   TO_DATE ('19.03.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '20.03.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '18.04.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('17.02.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '18.02.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '19.03.2018',
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
                                   TO_DATE ('17.02.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '18.02.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '19.03.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('18.01.2018', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '19.01.2018',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '17.02.2018',
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
                                   TO_DATE ('18.01.2018', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '19.01.2018',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '17.02.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('19.12.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '20.12.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '18.01.2018',
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
                                   TO_DATE ('19.12.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '20.12.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '18.01.2018',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            CASE
               WHEN (  SUM (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                                     TO_DATE ('19.11.2017', 'DD.MM.YYYY')
                             THEN
                                TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                          END)
                     - MIN (
                          CASE
                             WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                   '20.11.2017',
                                                                                   'DD.MM.YYYY')
                                                                            AND TO_DATE (
                                                                                   '19.12.2017',
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
                                   TO_DATE ('19.11.2017', 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END)
                   - MIN (
                        CASE
                           WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                                 '20.11.2017',
                                                                                 'DD.MM.YYYY')
                                                                          AND TO_DATE (
                                                                                 '19.12.2017',
                                                                                 'DD.MM.YYYY')
                           THEN
                              TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                        END))
            END,
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('31.10.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('14.11.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('15.10.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('15.09.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('16.08.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('17.07.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('17.06.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('18.05.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('18.04.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('19.03.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('17.02.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('18.01.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('19.12.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('19.11.2017', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('14.11.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.09.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.08.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.07.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.06.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.05.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (AVG (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.LMT_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '01.11.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.09.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.08.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.07.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.06.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.05.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '01.11.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.09.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.08.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.07.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.06.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.05.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.11.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.11.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.10.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.10.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.09.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.10.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.09.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.10.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '17.08.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.09.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '17.08.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.09.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.07.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '16.08.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.07.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '16.08.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.06.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.07.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.06.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.07.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.05.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.06.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.05.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.06.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.05.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.05.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.11.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '01.11.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.10.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.10.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '14.11.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.09.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.10.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '16.09.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.10.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '17.08.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.09.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '17.08.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '15.09.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.07.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '16.08.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.07.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '16.08.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.06.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.07.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.06.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.07.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.05.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.06.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.05.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.06.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.05.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.04.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.05.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.03.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.04.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '18.02.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.03.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '19.01.2018',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '17.02.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.12.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '18.01.2018',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (SUM (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT > 0
                   THEN
                      1
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                             '20.11.2017',
                                                                             'DD.MM.YYYY')
                                                                      AND TO_DATE (
                                                                             '19.12.2017',
                                                                             'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT = 0
                   THEN
                      0
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '31.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MIN (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.SUM_BALANCE
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY')
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 30
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 60
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 90
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 120
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 150
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 180
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 210
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 240
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 270
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 300
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN     TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                               TO_DATE ('14.11.2018', 'DD.MM.YYYY') - 330
                        AND TST_IRDM_G01_ODBL_CUST_1.OPEN_PRODUCT_CNT > 0
                   THEN
                      1
                   ELSE
                      0
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.09.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.08.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.07.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.06.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.05.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.PAID_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE =
                           TO_DATE ('14.11.2018', 'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.10.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '14.11.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '16.09.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.10.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '17.08.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '15.09.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.07.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '16.08.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.06.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.07.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.05.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.06.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.04.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.05.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.03.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.04.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '18.02.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.03.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '19.01.2018',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '17.02.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.12.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '18.01.2018',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (MAX (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '20.11.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.12.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '21.10.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '19.11.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '21.09.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '20.10.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '22.08.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '20.09.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.07.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '21.08.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.06.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.07.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.05.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.06.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.04.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.05.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.03.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.04.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '23.02.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.03.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '24.01.2017',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '22.02.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.12.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '23.01.2017',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END)),
            (SUM (
                CASE
                   WHEN TST_IRDM_G01_ODBL_CUST_1.PROCESS_DATE BETWEEN TO_DATE (
                                                                         '25.11.2016',
                                                                         'DD.MM.YYYY')
                                                                  AND TO_DATE (
                                                                         '24.12.2016',
                                                                         'DD.MM.YYYY')
                   THEN
                      TST_IRDM_G01_ODBL_CUST_1.CSH_AMNT
                END))
       FROM TGARSTG.TST_IRDM_G01_ODBL_CUST_F TST_IRDM_G01_ODBL_CUST_1
      WHERE (1 = 1) AND (TST_IRDM_G01_ODBL_CUST_1.IP_ID > 0)
   GROUP BY TST_IRDM_G01_ODBL_CUST_1.IP_ID
/

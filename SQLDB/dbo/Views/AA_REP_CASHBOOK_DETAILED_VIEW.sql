create view AA_REP_CASHBOOK_DETAILED_VIEW
as

-- Debit Code
select
   NTYPE
,  NCODE
,  NNAME
,  dbo.AA_VALUE_DPS_F(NOPENBALMONTH)               NOPENBALMONTH
,  dbo.AA_VALUE_DPS_F(NOPENBALMTH_C)               NOPENBALMTH_C
,  dbo.AA_VALUE_DPS_F(NBALANCE)                    NBALANCE
,  dbo.AA_VALUE_DPS_F(N_INCOME)                    N_INCOME
,  dbo.AA_VALUE_DPS_F(N_INCOME_C)                  N_INCOME_C
,  dbo.AA_VALUE_DPS_F(N_EXPENSES)                  N_EXPENSES
,  dbo.AA_VALUE_DPS_F(N_EXPENSES_C)                N_EXPENSES_C
,  dbo.AA_VALUE_DPS_F(NRECONBALANCE)               NRECONBALANCE
,  dbo.AA_VALUE_DPS_F(NRECONBALANCE_C)             NRECONBALANCE_C
,  NCURRENCYCODE
,  dbo.AA_VALUE_DPS_F(BANK_STMNT_ENDVAL)           BANK_STMNT_ENDVAL
,  dbo.AA_VALUE_DPS_F(BANK_STMNT_ENDVAL_C)         BANK_STMNT_ENDVAL_C
,  dbo.AA_VALUE_DPS_F(BANK_SUM_OF_RECONCILED)      BANK_SUM_OF_RECONCILED
,  dbo.AA_VALUE_DPS_F(BANK_SUM_OF_RECONCILED_C)    BANK_SUM_OF_RECONCILED_C
,  DET_HEADER_REF
,  DET_BATCH_REF
,  DET_DATE
,  DET_NOM_YEAR
,  DET_NOM_PERIOD
,  DET_TYPE
,  isnull(DET_ACCOUNT,'')                          DET_ACCOUNT
,  isnull(DET_RECONCILED ,0)                       DET_RECONCILED
,  DT_RECON_ORDER
,  DET_NOM_PERSORT
,  DET_ORIGIN
,  dbo.AA_VALUE_DPS_F(DET_NETT)                    DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_VAT)                     DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_GROSS)                   DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_CURR_NETT)               DET_CURR_NETT
,  dbo.AA_VALUE_DPS_F(DET_CURR_TAX)                DET_CURR_TAX
,  dbo.AA_VALUE_DPS_F(DET_CURR_GROSS)              DET_CURR_GROSS
,  isnull(DET_DIMENSION1,'')                       DET_DIMENSION1
,  isnull(DET_DIMENSION2,'')                       DET_DIMENSION2
,  isnull(DET_DIMENSION3,'')                       DET_DIMENSION3
,  isnull(DET_SUB_LEDGER,'')                       DET_SUB_LEDGER
,  isnull(DET_SUB_AUDIT_NO,0)                      DET_SUB_AUDIT_NO
,  DET_PRIMARY
,  isnull(DET_RECON_REF,'')                        DET_RECON_REF
,  DET_CURR_RATE
,  DET_CURR_CODE
,  DET_TRI_RATE1
,  DET_TRI_RATE2
,  DET_DESCRIPTION
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_GROSS <> 0  then  case substring(DET_ORIGIN,1,1)
                                       when 'S' then  case
                                                         when  (
                                                                  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE = 'S'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE <> 'S'
                                                                  )
                                                               )  then 0
                                                         else
                                                            DET_GROSS
                                                      end
                                       when 'P' then  case
                                                         when  (
                                                                  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE = 'P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE <> 'P'
                                                                  )
                                                               )  then 0
                                                         else
                                                            DET_NETT
                                                      end
                                       when 'N' then  DET_NETT
                                    end
      end
   ) INCOME
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_GROSS <> 0  then  case substring(DET_ORIGIN,1,1)
                                       when 'S' then  case
                                                         when  DET_TYPE = 'CRN'
                                                               or
                                                               (
                                                                        DET_TYPE in ('ACR','JCR')
                                                                  and   DET_ANALTYPE = 'S'
                                                               )
                                                               or
                                                               (
                                                                        DET_TYPE in ('ADR','JDR')
                                                                  and   DET_ANALTYPE <> 'S'
                                                               )
                                                               then DET_GROSS
                                                         else
                                                            0
                                                      end
                                       when 'P' then  case
                                                         when  DET_TYPE = 'CRN'
                                                               or
                                                               (
                                                                        DET_TYPE in ('ADR','JDR')
                                                                  and   DET_ANALTYPE = 'P'
                                                               )
                                                               or
                                                               (
                                                                        DET_TYPE in ('ACR','JCR')
                                                                  and   DET_ANALTYPE <> 'P'
                                                               )
                                                               then DET_NETT
                                                         else
                                                            0
                                                      end
                                       when 'N' then  0
                                    end
   end
   ) EXPENSES
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_CURR_NETT <> 0 then  case substring(DET_ORIGIN,1,1)
                                          when 'S' then  case
                                                            when  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE = 'S'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE <> 'S'
                                                                  )
                                                                  then 0
                                                            else
                                                               DET_CURR_NETT + DET_CURR_TAX
                                                         end
                                          when 'P' then  case
                                                            when  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE = 'P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE <> 'P'
                                                                  )
                                                                  then 0
                                                            else
                                                               DET_CURR_NETT
                                                         end
                                          when 'N' then  DET_CURR_NETT
                                       end
      end
   ) INCOME_C
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_CURR_NETT <> 0 then  case substring(DET_ORIGIN,1,1)
                                          when 'S' then  case
                                                            when  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE = 'S'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE <> 'S'
                                                                  )
                                                                  then DET_CURR_NETT + DET_CURR_TAX
                                                            else
                                                               0
                                                         end
                                          when 'P' then  case
                                                            when  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE = 'P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE <> 'P'
                                                                  )
                                                                  then DET_CURR_NETT
                                                            else
                                                               0
                                                         end
                                          when 'N' then  0
                                       end
      end
   ) EXPENSES_C
,  dbo.AA_VALUE_DPS_F(NOPENBALYEAR)                NOPENBALYEAR
,  dbo.AA_VALUE_DPS_F(NOPENBALANCELY)              NOPENBALANCELY
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L1)                NTURNOVER_L1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L2)                NTURNOVER_L2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L3)                NTURNOVER_L3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L4)                NTURNOVER_L4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L5)                NTURNOVER_L5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L6)                NTURNOVER_L6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L7)                NTURNOVER_L7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L8)                NTURNOVER_L8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L9)                NTURNOVER_L9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L10)               NTURNOVER_L10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L11)               NTURNOVER_L11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L12)               NTURNOVER_L12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L13)               NTURNOVER_L13
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C1)                NTURNOVER_C1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C2)                NTURNOVER_C2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C3)                NTURNOVER_C3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C4)                NTURNOVER_C4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C5)                NTURNOVER_C5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C6)                NTURNOVER_C6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C7)                NTURNOVER_C7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C8)                NTURNOVER_C8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C9)                NTURNOVER_C9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C10)               NTURNOVER_C10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C11)               NTURNOVER_C11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C12)               NTURNOVER_C12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C13)               NTURNOVER_C13
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N1)                NTURNOVER_N1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N2)                NTURNOVER_N2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N3)                NTURNOVER_N3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N4)                NTURNOVER_N4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N5)                NTURNOVER_N5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N6)                NTURNOVER_N6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N7)                NTURNOVER_N7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N8)                NTURNOVER_N8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N9)                NTURNOVER_N9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N10)               NTURNOVER_N10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N11)               NTURNOVER_N11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N12)               NTURNOVER_N12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N13)               NTURNOVER_N13
,  dbo.AA_VALUE_DPS_F(NOPENBALYR_C)                NOPENBALYR_C
,  dbo.AA_VALUE_DPS_F(NOPENBALANCLY_C)             NOPENBALANCLY_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L1_C)              NTURNOVER_L1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L2_C)              NTURNOVER_L2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L3_C)              NTURNOVER_L3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L4_C)              NTURNOVER_L4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L5_C)              NTURNOVER_L5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L6_C)              NTURNOVER_L6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L7_C)              NTURNOVER_L7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L8_C)              NTURNOVER_L8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L9_C)              NTURNOVER_L9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L10_C)             NTURNOVER_L10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L11_C)             NTURNOVER_L11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L12_C)             NTURNOVER_L12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L13_C)             NTURNOVER_L13_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C1_C)              NTURNOVER_C1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C2_C)              NTURNOVER_C2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C3_C)              NTURNOVER_C3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C4_C)              NTURNOVER_C4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C5_C)              NTURNOVER_C5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C6_C)              NTURNOVER_C6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C7_C)              NTURNOVER_C7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C8_C)              NTURNOVER_C8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C9_C)              NTURNOVER_C9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C10_C)             NTURNOVER_C10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C11_C)             NTURNOVER_C11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C12_C)             NTURNOVER_C12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C13_C)             NTURNOVER_C13_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N1_C)              NTURNOVER_N1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N2_C)              NTURNOVER_N2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N3_C)              NTURNOVER_N3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N4_C)              NTURNOVER_N4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N5_C)              NTURNOVER_N5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N6_C)              NTURNOVER_N6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N7_C)              NTURNOVER_N7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N8_C)              NTURNOVER_N8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N9_C)              NTURNOVER_N9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N10_C)             NTURNOVER_N10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N11_C)             NTURNOVER_N11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N12_C)             NTURNOVER_N12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N13_C)             NTURNOVER_N13_C
,  COMPANY_NAME
,  BANK_YEAR
,  BANK_PERIOD
,  BANK_STMNT_DATE
,  dbo.AA_VALUE_DPS_F(BANK_OPENING_RECONBALANCE)   BANK_OPENING_RECONBALANCE
,  dbo.AA_VALUE_DPS_F(BANK_OPENING_RECONBALANCE_C) BANK_OPENING_RECONBALANCE_C
,  HOME_CURR_SYMBL
,  YEAR_START_DATE
,  NO_OF_PERIODS
,  ENDDATE_P2
,  ENDDATE_P3
,  ENDDATE_P4
,  ENDDATE_P5
,  ENDDATE_P6
,  ENDDATE_P7
,  ENDDATE_P8
,  ENDDATE_P9
,  ENDDATE_P10
,  ENDDATE_P11
,  ENDDATE_P12
,  isnull(ENDDATE_P13,ENDDATE_P12)                 ENDDATE_P13
   from
      NL_ACCOUNTS
         inner join SYS_DATAINFO    with(nolock)               on       SYS_PRIMARY    = 1
         inner join SYS_DATAINFO2   with(nolock)               on       SYS_PRIMARY_2  = SYS_PRIMARY
         left  join SL_PL_NL_DETAIL with(index(DET_NOMINALDR)) on       DET_NOMINALDR  = NCODE
                                                                  and   DET_RECONCILED > 0
                                                                  and   isnull(DET_BATCH_FLAG, 0) = 0
                                                                  and   (
                                                                           DET_GROSS      <> 0
                                                                           or
                                                                           DET_CURR_NETT  <> 0
                                                                        )
         left  join NL_BANK_TRNS                               on       BANK_COPYNCODE       = DET_NOMINALDR
                                                                  and   BANK_RECON_COUNTER   = DT_RECON_ORDER
   where
      NTYPE in ('B','P')
union all
-- Credit Code
select
   NTYPE
,  NCODE
,  NNAME
,  dbo.AA_VALUE_DPS_F(NOPENBALMONTH)               NOPENBALMONTH
,  dbo.AA_VALUE_DPS_F(NOPENBALMTH_C)               NOPENBALMTH_C
,  dbo.AA_VALUE_DPS_F(NBALANCE)                    NBALANCE
,  dbo.AA_VALUE_DPS_F(N_INCOME)                    N_INCOME
,  dbo.AA_VALUE_DPS_F(N_INCOME_C)                  N_INCOME_C
,  dbo.AA_VALUE_DPS_F(N_EXPENSES)                  N_EXPENSES
,  dbo.AA_VALUE_DPS_F(N_EXPENSES_C)                N_EXPENSES_C
,  dbo.AA_VALUE_DPS_F(NRECONBALANCE)               NRECONBALANCE
,  dbo.AA_VALUE_DPS_F(NRECONBALANCE_C)             NRECONBALANCE_C
,  NCURRENCYCODE
,  dbo.AA_VALUE_DPS_F(BANK_STMNT_ENDVAL)           BANK_STMNT_ENDVAL
,  dbo.AA_VALUE_DPS_F(BANK_STMNT_ENDVAL_C)         BANK_STMNT_ENDVAL_C
,  dbo.AA_VALUE_DPS_F(BANK_SUM_OF_RECONCILED)      BANK_SUM_OF_RECONCILED
,  dbo.AA_VALUE_DPS_F(BANK_SUM_OF_RECONCILED_C)    BANK_SUM_OF_RECONCILED_C
,  DET_HEADER_REF
,  DET_BATCH_REF
,  DET_DATE
,  DET_NOM_YEAR
,  DET_NOM_PERIOD
,  DET_TYPE
,  isnull(DET_ACCOUNT,'')                          DET_ACCOUNT
,  isnull(DET_RECONCILED ,0)                       DET_RECONCILED
,  DT_RECON_ORDER
,  DET_NOM_PERSORT
,  DET_ORIGIN
,  dbo.AA_VALUE_DPS_F(DET_NETT)                    DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_VAT)                     DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_GROSS)                   DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_CURR_NETT)               DET_CURR_NETT
,  dbo.AA_VALUE_DPS_F(DET_CURR_TAX)                DET_CURR_TAX
,  dbo.AA_VALUE_DPS_F(DET_CURR_GROSS)              DET_CURR_GROSS
,  isnull(DET_DIMENSION1,'')                       DET_DIMENSION1
,  isnull(DET_DIMENSION2,'')                       DET_DIMENSION2
,  isnull(DET_DIMENSION3,'')                       DET_DIMENSION3
,  isnull(DET_SUB_LEDGER,'')                       DET_SUB_LEDGER
,  isnull(DET_SUB_AUDIT_NO,0)                      DET_SUB_AUDIT_NO
,  DET_PRIMARY
,  isnull(DET_RECON_REF,'')                        DET_RECON_REF
,  DET_CURR_RATE
,  DET_CURR_CODE
,  DET_TRI_RATE1
,  DET_TRI_RATE2
,  DET_DESCRIPTION
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_GROSS <> 0  then  case substring(DET_ORIGIN,1,1)
                                       when 'S' then  case
                                                         when  DET_TYPE in ('INV','PAY')
                                                               or
                                                               (
                                                                        DET_TYPE in ('ADR','JDR')
                                                                  and   DET_ANALTYPE = 'S'
                                                               )
                                                               or
                                                               (
                                                                        DET_TYPE in ('ACR','JCR')
                                                                  and   DET_ANALTYPE <> 'S'
                                                               )
                                                               then 0
                                                         else
                                                            DET_NETT
                                                      end
                                       when 'P' then  case
                                                         when  DET_TYPE in ('INV','PAY')
                                                               or
                                                               (
                                                                        DET_TYPE in ('ACR','JCR')
                                                                  and   DET_ANALTYPE = 'P'
                                                               )
                                                               or
                                                               (
                                                                        DET_TYPE in ('ADR','JDR')
                                                                  and   DET_ANALTYPE <> 'P'
                                                               )
                                                               then 0
                                                         else
                                                            DET_GROSS
                                                      end
                                       when 'N' then  0
                                    end
      end
   ) N_INCOME
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_GROSS <> 0  then  case substring(DET_ORIGIN,1,1)
                                       when 'S' then  case
                                                         when  DET_TYPE in ('INV','PAY')
                                                               or
                                                               (
                                                                        DET_TYPE in ('ADR','JDR')
                                                                  and   DET_ANALTYPE = 'S'
                                                               )
                                                               or
                                                               (
                                                                        DET_TYPE in ('ACR','JCR')
                                                                  and   DET_ANALTYPE <> 'S'
                                                               )
                                                               then DET_NETT
                                                         else
                                                            0
                                                      end
                                       when 'P' then  case
                                                         when  DET_TYPE in ('INV','PAY')
                                                               or
                                                               (
                                                                        DET_TYPE in ('ACR','JCR')
                                                                  and   DET_ANALTYPE = 'P'
                                                               )
                                                               or
                                                               (
                                                                        DET_TYPE in ('ADR','JDR')
                                                                  and   DET_ANALTYPE <> 'P'
                                                               )
                                                               then DET_GROSS
                                                         else
                                                            0
                                                      end
                                       when 'N' then  DET_NETT
                                    end
      end
   ) N_EXPENSES
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_CURR_NETT <> 0 then  case substring(DET_ORIGIN,1,1)
                                          when 'S' then  case
                                                            when  DET_TYPE in ('INV','PAY')
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE = 'S'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE <> 'S'
                                                                  )
                                                                  then 0
                                                            else
                                                               DET_CURR_NETT
                                                         end
                                          when 'P' then  case
                                                            when  DET_TYPE in ('INV','PAY')
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE = 'P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE <> 'P'
                                                                  )
                                                                  then 0
                                                            else
                                                               DET_CURR_NETT + DET_CURR_TAX
                                                         end
                                          when 'N' then  0
                                       end
      end
   ) N_INCOME_C
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_CURR_NETT <> 0 then  case substring(DET_ORIGIN,1,1)
                                          when 'S' then  case
                                                            when  (
                                                                     DET_TYPE in ('INV','PAY')
                                                                     or
                                                                     (
                                                                              DET_TYPE in ('ADR','JDR')
                                                                        and   DET_ANALTYPE='S'
                                                                     )
                                                                     or
                                                                     (
                                                                              DET_TYPE in ('ACR','JCR')
                                                                        and   DET_ANALTYPE<>'S'
                                                                     )
                                                                  )
                                                                  then DET_CURR_NETT
                                                            else
                                                               0
                                                         end
                                          when 'P' then  case
                                                            when  DET_TYPE in ('INV','PAY')
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ACR','JCR')
                                                                     and   DET_ANALTYPE='P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE in ('ADR','JDR')
                                                                     and   DET_ANALTYPE<>'P'
                                                                  )
                                                                  then DET_CURR_NETT + DET_CURR_TAX
                                                            else
                                                               0
                                                         end
                                          when 'N' then  DET_CURR_NETT
                                       end
      end
   ) N_EXPENSES_C
,  dbo.AA_VALUE_DPS_F(NOPENBALYEAR)                NOPENBALYEAR
,  dbo.AA_VALUE_DPS_F(NOPENBALANCELY)              NOPENBALANCELY
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L1)                NTURNOVER_L1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L2)                NTURNOVER_L2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L3)                NTURNOVER_L3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L4)                NTURNOVER_L4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L5)                NTURNOVER_L5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L6)                NTURNOVER_L6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L7)                NTURNOVER_L7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L8)                NTURNOVER_L8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L9)                NTURNOVER_L9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L10)               NTURNOVER_L10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L11)               NTURNOVER_L11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L12)               NTURNOVER_L12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L13)               NTURNOVER_L13
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C1)                NTURNOVER_C1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C2)                NTURNOVER_C2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C3)                NTURNOVER_C3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C4)                NTURNOVER_C4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C5)                NTURNOVER_C5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C6)                NTURNOVER_C6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C7)                NTURNOVER_C7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C8)                NTURNOVER_C8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C9)                NTURNOVER_C9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C10)               NTURNOVER_C10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C11)               NTURNOVER_C11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C12)               NTURNOVER_C12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C13)               NTURNOVER_C13
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N1)                NTURNOVER_N1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N2)                NTURNOVER_N2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N3)                NTURNOVER_N3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N4)                NTURNOVER_N4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N5)                NTURNOVER_N5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N6)                NTURNOVER_N6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N7)                NTURNOVER_N7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N8)                NTURNOVER_N8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N9)                NTURNOVER_N9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N10)               NTURNOVER_N10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N11)               NTURNOVER_N11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N12)               NTURNOVER_N12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N13)               NTURNOVER_N13
,  dbo.AA_VALUE_DPS_F(NOPENBALYR_C)                NOPENBALYR_C
,  dbo.AA_VALUE_DPS_F(NOPENBALANCLY_C)             NOPENBALANCLY_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L1_C)              NTURNOVER_L1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L2_C)              NTURNOVER_L2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L3_C)              NTURNOVER_L3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L4_C)              NTURNOVER_L4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L5_C)              NTURNOVER_L5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L6_C)              NTURNOVER_L6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L7_C)              NTURNOVER_L7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L8_C)              NTURNOVER_L8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L9_C)              NTURNOVER_L9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L10_C)             NTURNOVER_L10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L11_C)             NTURNOVER_L11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L12_C)             NTURNOVER_L12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L13_C)             NTURNOVER_L13_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C1_C)              NTURNOVER_C1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C2_C)              NTURNOVER_C2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C3_C)              NTURNOVER_C3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C4_C)              NTURNOVER_C4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C5_C)              NTURNOVER_C5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C6_C)              NTURNOVER_C6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C7_C)              NTURNOVER_C7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C8_C)              NTURNOVER_C8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C9_C)              NTURNOVER_C9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C10_C)             NTURNOVER_C10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C11_C)             NTURNOVER_C11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C12_C)             NTURNOVER_C12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C13_C)             NTURNOVER_C13_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N1_C)              NTURNOVER_N1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N2_C)              NTURNOVER_N2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N3_C)              NTURNOVER_N3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N4_C)              NTURNOVER_N4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N5_C)              NTURNOVER_N5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N6_C)              NTURNOVER_N6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N7_C)              NTURNOVER_N7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N8_C)              NTURNOVER_N8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N9_C)              NTURNOVER_N9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N10_C)             NTURNOVER_N10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N11_C)             NTURNOVER_N11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N12_C)             NTURNOVER_N12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N13_C)             NTURNOVER_N13_C
,  COMPANY_NAME
,  BANK_YEAR
,  BANK_PERIOD
,  BANK_STMNT_DATE
,  dbo.AA_VALUE_DPS_F(BANK_OPENING_RECONBALANCE)   BANK_OPENING_RECONBALANCE
,  dbo.AA_VALUE_DPS_F(BANK_OPENING_RECONBALANCE_C) BANK_OPENING_RECONBALANCE_C
,  HOME_CURR_SYMBL
,  YEAR_START_DATE
,  NO_OF_PERIODS
,  ENDDATE_P2
,  ENDDATE_P3
,  ENDDATE_P4
,  ENDDATE_P5
,  ENDDATE_P6
,  ENDDATE_P7
,  ENDDATE_P8
,  ENDDATE_P9
,  ENDDATE_P10
,  ENDDATE_P11
,  ENDDATE_P12
,  isnull(ENDDATE_P13,ENDDATE_P12)                 ENDDATE_P13
   from
      NL_ACCOUNTS
         inner join SYS_DATAINFO    with(nolock)               on       SYS_PRIMARY = 1
         inner join SYS_DATAINFO2   with(nolock)               on       SYS_PRIMARY_2  = SYS_PRIMARY
         left  join SL_PL_NL_DETAIL with(index(DET_NOMINALCR)) on       DET_NOMINALCR = NCODE
                                                                  and   DET_RECONCILED > 0
                                                                  and   isnull(DET_BATCH_FLAG, 0) <> 1
                                                                  and   (
                                                                           DET_GROSS <> 0
                                                                           or
                                                                           DET_CURR_NETT <> 0
                                                                        )
         left  join NL_BANK_TRNS                               on       BANK_COPYNCODE       = DET_NOMINALCR
                                                                  and   BANK_RECON_COUNTER   = DT_RECON_ORDER
   where
      NTYPE in ('B','P')
union all
-- VAT Nominal Code
select
   NTYPE
,  NCODE
,  NNAME
,  dbo.AA_VALUE_DPS_F(NOPENBALMONTH)               NOPENBALMONTH
,  dbo.AA_VALUE_DPS_F(NOPENBALMTH_C)               NOPENBALMTH_C
,  dbo.AA_VALUE_DPS_F(NBALANCE)                    NBALANCE
,  dbo.AA_VALUE_DPS_F(N_INCOME)                    N_INCOME
,  dbo.AA_VALUE_DPS_F(N_INCOME_C)                  N_INCOME_C
,  dbo.AA_VALUE_DPS_F(N_EXPENSES)                  N_EXPENSES
,  dbo.AA_VALUE_DPS_F(N_EXPENSES_C)                N_EXPENSES_C
,  dbo.AA_VALUE_DPS_F(NRECONBALANCE)               NRECONBALANCE
,  dbo.AA_VALUE_DPS_F(NRECONBALANCE_C)             NRECONBALANCE_C
,  NCURRENCYCODE
,  dbo.AA_VALUE_DPS_F(BANK_STMNT_ENDVAL)           BANK_STMNT_ENDVAL
,  dbo.AA_VALUE_DPS_F(BANK_STMNT_ENDVAL_C)         BANK_STMNT_ENDVAL_C
,  dbo.AA_VALUE_DPS_F(BANK_SUM_OF_RECONCILED)      BANK_SUM_OF_RECONCILED
,  dbo.AA_VALUE_DPS_F(BANK_SUM_OF_RECONCILED_C)    BANK_SUM_OF_RECONCILED_C
,  DET_HEADER_REF
,  DET_BATCH_REF
,  DET_DATE
,  DET_NOM_YEAR
,  DET_NOM_PERIOD
,  DET_TYPE
,  isnull(DET_ACCOUNT,'')                          DET_ACCOUNT
,  isnull(DET_RECONCILED ,0)                       DET_RECONCILED
,  DT_RECON_ORDER
,  DET_NOM_PERSORT
,  DET_ORIGIN
,  dbo.AA_VALUE_DPS_F(DET_NETT)                    DET_NETT
,  dbo.AA_VALUE_DPS_F(DET_VAT)                     DET_VAT
,  dbo.AA_VALUE_DPS_F(DET_GROSS)                   DET_GROSS
,  dbo.AA_VALUE_DPS_F(DET_CURR_NETT)               DET_CURR_NETT
,  dbo.AA_VALUE_DPS_F(DET_CURR_TAX)                DET_CURR_TAX
,  dbo.AA_VALUE_DPS_F(DET_CURR_GROSS)              DET_CURR_GROSS
,  isnull(DET_DIMENSION1,'')                       DET_DIMENSION1
,  isnull(DET_DIMENSION2,'')                       DET_DIMENSION2
,  isnull(DET_DIMENSION3,'')                       DET_DIMENSION3
,  isnull(DET_SUB_LEDGER,'')                       DET_SUB_LEDGER
,  isnull(DET_SUB_AUDIT_NO,0)                      DET_SUB_AUDIT_NO
,  DET_PRIMARY
,  isnull(DET_RECON_REF,'')                        DET_RECON_REF
,  DET_CURR_RATE
,  DET_CURR_CODE
,  DET_TRI_RATE1
,  DET_TRI_RATE2
,  DET_DESCRIPTION
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_VAT <> 0 then  case substring(DET_ORIGIN,1,1)
                                    when 'S' then  case
                                                      when  DET_TYPE in ('INV','PAY')
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ADR'
                                                               and   DET_ANALTYPE   = 'S'
                                                            )
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ACR'
                                                               and   DET_ANALTYPE  <> 'S'
                                                            )
                                                            then 0
                                                      else
                                                         DET_VAT
                                                   end
                                    when 'P' then  case
                                                      when  DET_TYPE = 'CRN'
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ADR'
                                                               and   DET_ANALTYPE   = 'P'
                                                            )
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ACR'
                                                               and   DET_ANALTYPE  <> 'P'
                                                            )

                                                            then 0
                                                      else
                                                         DET_VAT
                                                   end
                                    when 'N' then  0
                                 end
      end
   ) N_INCOME
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_VAT <> 0 then  case substring(DET_ORIGIN,1,1)
                                    when 'S' then  case
                                                      when  DET_TYPE in ('INV','PAY')
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ADR'
                                                               and   DET_ANALTYPE   = 'S'
                                                            )
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ACR'
                                                               and   DET_ANALTYPE  <> 'S'
                                                            )
                                                            then DET_VAT
                                                      else
                                                         0
                                                   end
                                    when 'P' then  case
                                                      when  DET_TYPE = 'CRN'
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ADR'
                                                               and   DET_ANALTYPE   = 'P'
                                                            )
                                                            or
                                                            (
                                                                     DET_TYPE       = 'ACR'
                                                               and   DET_ANALTYPE  <> 'P'
                                                            )
                                                            then DET_VAT
                                                      else
                                                         0
                                                   end
                                    when 'N' then  0
                                 end
      end
   ) N_EXPENSES
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_CURR_NETT <> 0 then  case substring(DET_ORIGIN,1,1)
                                          when 'S' then  case
                                                            when  DET_TYPE in ('INV','PAY')
                                                                  or
                                                                  (
                                                                           DET_TYPE       = 'ADR'
                                                                     and   DET_ANALTYPE   = 'S'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE       = 'ACR'
                                                                     and   DET_ANALTYPE  <> 'S'
                                                                  )
                                                                  then 0
                                                            else
                                                               DET_CURR_TAX
                                                         end
                                          when 'P' then  case
                                                            when  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE = 'ADR'
                                                                     and   DET_ANALTYPE='P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE = 'ACR'
                                                                     and   DET_ANALTYPE<>'P'
                                                                  )
                                                                  then 0
                                                            else
                                                               DET_CURR_TAX
                                                         end
                                          when 'N' then  0
                                       end
      end
   ) N_INCOME_C
,  dbo.AA_VALUE_DPS_F
   (
      case
         when DET_CURR_NETT <> 0 then  case substring(DET_ORIGIN,1,1)
                                          when 'S' then  case
                                                            when  DET_TYPE in ('INV','PAY')
                                                                  or
                                                                  (
                                                                           DET_TYPE       = 'ADR'
                                                                     and   DET_ANALTYPE   = 'S'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE       = 'ACR'
                                                                     and   DET_ANALTYPE  <> 'S'
                                                                  )
                                                                  then DET_CURR_TAX
                                                            else
                                                               0
                                                         end
                                          when 'P' then  case
                                                            when  DET_TYPE = 'CRN'
                                                                  or
                                                                  (
                                                                           DET_TYPE       = 'ADR'
                                                                     and   DET_ANALTYPE   = 'P'
                                                                  )
                                                                  or
                                                                  (
                                                                           DET_TYPE       = 'ACR'
                                                                     and   DET_ANALTYPE  <> 'P'
                                                                  )
                                                                  then DET_CURR_TAX
                                                            else
                                                               0
                                                         end
                                          when 'N' then  0
                                       end
      end
   ) N_EXPENSES_C
,  dbo.AA_VALUE_DPS_F(NOPENBALYEAR)                NOPENBALYEAR
,  dbo.AA_VALUE_DPS_F(NOPENBALANCELY)              NOPENBALANCELY
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L1)                NTURNOVER_L1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L2)                NTURNOVER_L2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L3)                NTURNOVER_L3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L4)                NTURNOVER_L4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L5)                NTURNOVER_L5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L6)                NTURNOVER_L6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L7)                NTURNOVER_L7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L8)                NTURNOVER_L8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L9)                NTURNOVER_L9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L10)               NTURNOVER_L10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L11)               NTURNOVER_L11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L12)               NTURNOVER_L12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L13)               NTURNOVER_L13
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C1)                NTURNOVER_C1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C2)                NTURNOVER_C2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C3)                NTURNOVER_C3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C4)                NTURNOVER_C4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C5)                NTURNOVER_C5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C6)                NTURNOVER_C6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C7)                NTURNOVER_C7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C8)                NTURNOVER_C8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C9)                NTURNOVER_C9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C10)               NTURNOVER_C10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C11)               NTURNOVER_C11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C12)               NTURNOVER_C12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C13)               NTURNOVER_C13
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N1)                NTURNOVER_N1
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N2)                NTURNOVER_N2
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N3)                NTURNOVER_N3
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N4)                NTURNOVER_N4
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N5)                NTURNOVER_N5
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N6)                NTURNOVER_N6
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N7)                NTURNOVER_N7
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N8)                NTURNOVER_N8
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N9)                NTURNOVER_N9
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N10)               NTURNOVER_N10
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N11)               NTURNOVER_N11
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N12)               NTURNOVER_N12
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N13)               NTURNOVER_N13
,  dbo.AA_VALUE_DPS_F(NOPENBALYR_C)                NOPENBALYR_C
,  dbo.AA_VALUE_DPS_F(NOPENBALANCLY_C)             NOPENBALANCLY_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L1_C)              NTURNOVER_L1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L2_C)              NTURNOVER_L2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L3_C)              NTURNOVER_L3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L4_C)              NTURNOVER_L4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L5_C)              NTURNOVER_L5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L6_C)              NTURNOVER_L6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L7_C)              NTURNOVER_L7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L8_C)              NTURNOVER_L8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L9_C)              NTURNOVER_L9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L10_C)             NTURNOVER_L10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L11_C)             NTURNOVER_L11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L12_C)             NTURNOVER_L12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_L13_C)             NTURNOVER_L13_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C1_C)              NTURNOVER_C1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C2_C)              NTURNOVER_C2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C3_C)              NTURNOVER_C3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C4_C)              NTURNOVER_C4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C5_C)              NTURNOVER_C5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C6_C)              NTURNOVER_C6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C7_C)              NTURNOVER_C7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C8_C)              NTURNOVER_C8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C9_C)              NTURNOVER_C9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C10_C)             NTURNOVER_C10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C11_C)             NTURNOVER_C11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C12_C)             NTURNOVER_C12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_C13_C)             NTURNOVER_C13_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N1_C)              NTURNOVER_N1_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N2_C)              NTURNOVER_N2_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N3_C)              NTURNOVER_N3_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N4_C)              NTURNOVER_N4_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N5_C)              NTURNOVER_N5_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N6_C)              NTURNOVER_N6_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N7_C)              NTURNOVER_N7_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N8_C)              NTURNOVER_N8_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N9_C)              NTURNOVER_N9_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N10_C)             NTURNOVER_N10_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N11_C)             NTURNOVER_N11_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N12_C)             NTURNOVER_N12_C
,  dbo.AA_VALUE_DPS_F(NTURNOVER_N13_C)             NTURNOVER_N13_C
,  COMPANY_NAME
,  BANK_YEAR
,  BANK_PERIOD
,  BANK_STMNT_DATE
,  dbo.AA_VALUE_DPS_F(BANK_OPENING_RECONBALANCE)   BANK_OPENING_RECONBALANCE
,  dbo.AA_VALUE_DPS_F(BANK_OPENING_RECONBALANCE_C) BANK_OPENING_RECONBALANCE_C
,  HOME_CURR_SYMBL
,  YEAR_START_DATE
,  NO_OF_PERIODS
,  ENDDATE_P2
,  ENDDATE_P3
,  ENDDATE_P4
,  ENDDATE_P5
,  ENDDATE_P6
,  ENDDATE_P7
,  ENDDATE_P8
,  ENDDATE_P9
,  ENDDATE_P10
,  ENDDATE_P11
,  ENDDATE_P12
,  isnull(ENDDATE_P13,ENDDATE_P12)                 ENDDATE_P13
   from
      NL_ACCOUNTS
         inner join SYS_DATAINFO    with(nolock)                  on       SYS_PRIMARY    = 1
         inner join SYS_DATAINFO2   with(nolock)                  on       SYS_PRIMARY_2  = SYS_PRIMARY
         left  join SL_PL_NL_DETAIL with(index(DET_NOMINALVAT))   on       DET_NOMINALVAT = NCODE
                                                                     and   DET_RECONCILED > 0
                                                                     and   isnull(DET_BATCH_FLAG, 0) <> 1
                                                                     and   DET_VAT <> 0
                                                                     and   (
                                                                              (DET_GROSS     <> 0)
                                                                              or
                                                                              (DET_CURR_NETT <> 0)
                                                                           )

         left  join NL_BANK_TRNS                                  on       BANK_COPYNCODE       = DET_NOMINALVAT
                                                                     and   BANK_RECON_COUNTER   = DT_RECON_ORDER
   where
      NTYPE IN ('B','P')
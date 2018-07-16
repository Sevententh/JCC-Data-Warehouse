CREATE VIEW AA_NL_RECORD_VIEW
/*
** Written:        10/02/03 NC
** Last Amended:   19/07/04 NC
*/
( Major_Heading_Code
, Major_Heading_Name
, Major_Heading_Marker
, Code
, Type
, Name
, Trading_Currency_Code
, Trading_Currency_Notes
, First_Category_Code
, Second_Category_Code
, Third_Category_Code
, Forth_Category_Code
, Fifth_Category_Code
, Sixth_Category_Code
, Seventh_Category_Code
, Eighth_Category_Code
, First_Category_Name
, Second_Category_Name
, Third_Category_Name
, Fourth_Category_Name
, Fifth_Category_Name
, Sixth_Category_Name
, Seventh_Category_Name
, Eighth_Category_Name
, First_Category_Short_Name
, Second_Category_Short_Name
, Third_Category_Short_Name
, Fourth_Category_Short_Name
, Fifth_Category_Short_Name
, Sixth_Category_Short_Name
, Seventh_Category_Short_Name
, Eighth_Category_Short_Name
, Year_End_Account_Code
, Year_End_Account_Name
, Security_Level
, Exclude_From_Transactions
, Exclude_From_Records
, Centralised
, Allow_Zero_Budget
, Compulsory_Costing
, Notes
, Profiled
, Created_Date
, Last_Edited_Date
, Created_User_ID
, Last_Edited_User_ID
, User_Char1
, User_Char2
, User_Char3
, User_Char4
, User_Char5
, User_Char6
, User_Date1
, User_Date2
, User_Date3
, User_Flag1
, User_Flag2
, User_Flag3
, User_Number1
, User_Number2
, User_Number3
, Nominal_Primary
, Used
, Balance
, Turnover_YTD
, Turnover_PTD
, Last_Turnover
, Year_Open_Balance
, Month_Open_Balance
, Last_Year_Open_Balance
, Reconciled_Balance
, Bank_Income
, Bank_Expenses
, Currency_Balance
, Currency_Turnover_YTD
, Currency_Turnover_PTD
, Currency_Last_Year_Turnover
, Currency_Year_Open_Balance
, Currency_Month_Open_Balance
, Currency_Last_Year_Open_Balance
, Currency_Reconciled_Balance
, Currency_Bank_Income
, Currency_Bank_Expenses)
AS
SELECT 
 N1.NMAJORHEADCODE
, NL_MAJORNAME
, NL_MAJORMARKER
, N1.NCODE
, N1.NTYPE
, N1.NNAME
, N1.NCURRENCYCODE
, CURREC_DESCRIPTION
, N1.NCATEGORYCODE1
, N1.NCATEGORYCODE2
, N1.NCATEGORYCODE3
, N1.NCATEGORYCODE4
, N1.NCATEGORYCODE5
, N1.NCATEGORYCODE6
, N1.NCATEGORYCODE7
, N1.NCATEGORYCODE8
, C1.NL_CATEGORYNAME
, C2.NL_CATEGORYNAME
, C3.NL_CATEGORYNAME
, C4.NL_CATEGORYNAME
, C5.NL_CATEGORYNAME
, C6.NL_CATEGORYNAME
, C7.NL_CATEGORYNAME
, C8.NL_CATEGORYNAME
, C1.NL_SHORTNAME
, C2.NL_SHORTNAME
, C3.NL_SHORTNAME
, C4.NL_SHORTNAME
, C5.NL_SHORTNAME
, C6.NL_SHORTNAME
, C7.NL_SHORTNAME
, C8.NL_SHORTNAME
, N1.NYEAR_END_CODE
, N2.NNAME
, N_LEVEL
, N1.N_EXCLUDE_TRNREP
, N1.N_EXCLUDE_RECREP
, N1.N_CENTRALISED
, N1.N_USE_ZERO_BUDGET
, N1.N_FORCE_COSTING
, N1.NNOTES
, N1.N_PROFILE_REC
, N1.N_DATE_PUTIN
, N1.N_DATE_EDITED
, N1.N_USER_PUTIN
, N1.N_USER_EDITED
, N_USRCHAR1
, N_USRCHAR2
, N_USRCHAR5
, N_USRCHAR6
, N_USRCHAR7
, N_USRCHAR8
, N_USRDATE1
, N_USRDATE2
, N_USRDATE3
, N_USRFLAG1
, N_USRFLAG2
, N_USRFLAG3
, N_USRNUM1
, N_USRNUM2
, N_USRNUM3
, N1.N_PRIMARY
, N1.NUSED
, convert(decimal(16, 2), N1.NBALANCE)
, convert(decimal(16, 2), N1.NTURNOVERYTD)
, convert(decimal(16, 2), N1.NTURNOVERPTD)
, convert(decimal(16, 2), N1.NTURNOVERLY)
, convert(decimal(16, 2), N1.NOPENBALYEAR)
, convert(decimal(16, 2), N1.NOPENBALMONTH)
, convert(decimal(16, 2), N1.NOPENBALANCELY)
, convert(decimal(16, 2), N1.NRECONBALANCE)
, convert(decimal(16, 2), N1.N_INCOME)
, convert(decimal(16, 2), N1.N_EXPENSES)

, convert(decimal(16, 2), N1.NBALANCE_C)
, convert(decimal(16, 2), N1.NTURNOVRYTD_C)
, convert(decimal(16, 2), N1.NTURNOVRPTD_C)
, convert(decimal(16, 2), N1.NTURNOVRLY_C)
, convert(decimal(16, 2), N1.NOPENBALYR_C)
, convert(decimal(16, 2), N1.NOPENBALMTH_C)
, convert(decimal(16, 2), N1.NOPENBALANCLY_C)
, convert(decimal(16, 2), N1.NRECONBALANCE_C)
, convert(decimal(16, 2), N1.N_INCOME_C)
, convert(decimal(16, 2), N1.N_EXPENSES_C)

from NL_ACCOUNTS N1
 
  inner join NL_ACCOUNTS2
  on NL_ACCOUNTS2.N_PRIMARY_2 = N1.N_PRIMARY

  inner join SYS_CURRENCY_REC
  on SYS_CURRENCY_REC.CURREC_SYMBOL = N1.NCURRENCYCODE
   
  inner join NL_MAJORHEADING
  on NL_MAJORHEADING.NL_MAJORCODE = N1.NMAJORHEADCODE

  left outer join NL_ACCOUNTS N2 
  on N2.NCODE = N1.NYEAR_END_CODE
   
  left outer join NL_CATEGORY C1
  on C1.NL_CAT_SORTCODE = '1' + N1.NCATEGORYCODE1

  left outer join NL_CATEGORY C2
  on C2.NL_CAT_SORTCODE = '2' + N1.NCATEGORYCODE2
  
  left outer join NL_CATEGORY C3
  on C3.NL_CAT_SORTCODE = '3' + N1.NCATEGORYCODE3

  left outer join NL_CATEGORY C4
  on C4.NL_CAT_SORTCODE = '4' + N1.NCATEGORYCODE4

  left outer join NL_CATEGORY C5
  on C5.NL_CAT_SORTCODE = '5' + N1.NCATEGORYCODE5

  left outer join NL_CATEGORY C6
  on C6.NL_CAT_SORTCODE = '6' + N1.NCATEGORYCODE6
  
  left outer join NL_CATEGORY C7
  on C7.NL_CAT_SORTCODE = '7' + N1.NCATEGORYCODE7

  left outer join NL_CATEGORY C8
  on C8.NL_CAT_SORTCODE = '8' + N1.NCATEGORYCODE8


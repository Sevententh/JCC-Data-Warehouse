﻿CREATE VIEW [dbo].[AA_AOI_PROFIT_LOSS_BALANCE_SHEET_SUMMARY_VIEW_NO_ADVANCED] (
    [MajorHeadingCode],
    [MajorHeadingName],
    [MajorHeadingMarker],
    [CategoryCode1],
    [CategoryCode2],
    [CategoryCode3],
    [CategoryCode4],
    [CategoryCode5],
    [CategoryCode6],
    [CategoryCode7],
    [CategoryCode8],
    [CategoryName1],
    [CategoryName2],
    [CategoryName3],
    [CategoryName4],
    [CategoryName5],
    [CategoryName6],
    [CategoryName7],
    [CategoryName8],
    [CategoryShortName1],
    [CategoryShortName2],
    [CategoryShortName3],
    [CategoryShortName4],
    [CategoryShortName5],
    [CategoryShortName6],
    [CategoryShortName7],
    [CategoryShortName8],
    [AccountCode],
    [AccountType],
    [AccountName],
    [AccountInactive],
    [AccountCurrencyCode],
    [AccountSecurityLevel],
    [ExcludeFromRecordReports],
    [AllowZeroBudgets],
    [Balance],
    [OpeningBalance],
    [TurnoverPtd],
    [TurnoverYtd],
    [TurnoverLastYtd],
    [CurrencyTurnoverPtd],
    [CurrencyTurnoverYtd],
    [CurrencyTurnoverLastYtd],
    [BudgetPtd],
    [BudgetYtd],
    [BudgetLastYtd],
    [TurnoverC1],
    [TurnoverC2],
    [TurnoverC3],
    [TurnoverC4],
    [TurnoverC5],
    [TurnoverC6],
    [TurnoverC7],
    [TurnoverC8],
    [TurnoverC9],
    [TurnoverC10],
    [TurnoverC11],
    [TurnoverC12],
    [TurnoverC13],
    [BalanceYearToC1],
    [BalanceYearToC2],
    [BalanceYearToC3],
    [BalanceYearToC4],
    [BalanceYearToC5],
    [BalanceYearToC6],
    [BalanceYearToC7],
    [BalanceYearToC8],
    [BalanceYearToC9],
    [BalanceYearToC10],
    [BalanceYearToC11],
    [BalanceYearToC12],
    [BalanceYearToC13],
    [TurnoverYearToC1],
    [TurnoverYearToC2],
    [TurnoverYearToC3],
    [TurnoverYearToC4],
    [TurnoverYearToC5],
    [TurnoverYearToC6],
    [TurnoverYearToC7],
    [TurnoverYearToC8],
    [TurnoverYearToC9],
    [TurnoverYearToC10],
    [TurnoverYearToC11],
    [TurnoverYearToC12],
    [TurnoverYearToC13],
    [CurrencyTurnoverC1],
    [CurrencyTurnoverC2],
    [CurrencyTurnoverC3],
    [CurrencyTurnoverC4],
    [CurrencyTurnoverC5],
    [CurrencyTurnoverC6],
    [CurrencyTurnoverC7],
    [CurrencyTurnoverC8],
    [CurrencyTurnoverC9],
    [CurrencyTurnoverC10],
    [CurrencyTurnoverC11],
    [CurrencyTurnoverC12],
    [CurrencyTurnoverC13],
    [CurrencyBalanceYearToC1],
    [CurrencyBalanceYearToC2],
    [CurrencyBalanceYearToC3],
    [CurrencyBalanceYearToC4],
    [CurrencyBalanceYearToC5],
    [CurrencyBalanceYearToC6],
    [CurrencyBalanceYearToC7],
    [CurrencyBalanceYearToC8],
    [CurrencyBalanceYearToC9],
    [CurrencyBalanceYearToC10],
    [CurrencyBalanceYearToC11],
    [CurrencyBalanceYearToC12],
    [CurrencyBalanceYearToC13],
    [CurrencyTurnoverYearToC1],
    [CurrencyTurnoverYearToC2],
    [CurrencyTurnoverYearToC3],
    [CurrencyTurnoverYearToC4],
    [CurrencyTurnoverYearToC5],
    [CurrencyTurnoverYearToC6],
    [CurrencyTurnoverYearToC7],
    [CurrencyTurnoverYearToC8],
    [CurrencyTurnoverYearToC9],
    [CurrencyTurnoverYearToC10],
    [CurrencyTurnoverYearToC11],
    [CurrencyTurnoverYearToC12],
    [CurrencyTurnoverYearToC13],
    [TurnoverL1],
    [TurnoverL2],
    [TurnoverL3],
    [TurnoverL4],
    [TurnoverL5],
    [TurnoverL6],
    [TurnoverL7],
    [TurnoverL8],
    [TurnoverL9],
    [TurnoverL10],
    [TurnoverL11],
    [TurnoverL12],
    [TurnoverL13],
    [BalanceYearToL1],
    [BalanceYearToL2],
    [BalanceYearToL3],
    [BalanceYearToL4],
    [BalanceYearToL5],
    [BalanceYearToL6],
    [BalanceYearToL7],
    [BalanceYearToL8],
    [BalanceYearToL9],
    [BalanceYearToL10],
    [BalanceYearToL11],
    [BalanceYearToL12],
    [BalanceYearToL13],
    [TurnoverYearToL1],
    [TurnoverYearToL2],
    [TurnoverYearToL3],
    [TurnoverYearToL4],
    [TurnoverYearToL5],
    [TurnoverYearToL6],
    [TurnoverYearToL7],
    [TurnoverYearToL8],
    [TurnoverYearToL9],
    [TurnoverYearToL10],
    [TurnoverYearToL11],
    [TurnoverYearToL12],
    [TurnoverYearToL13],
    [CurrencyTurnoverL1],
    [CurrencyTurnoverL2],
    [CurrencyTurnoverL3],
    [CurrencyTurnoverL4],
    [CurrencyTurnoverL5],
    [CurrencyTurnoverL6],
    [CurrencyTurnoverL7],
    [CurrencyTurnoverL8],
    [CurrencyTurnoverL9],
    [CurrencyTurnoverL10],
    [CurrencyTurnoverL11],
    [CurrencyTurnoverL12],
    [CurrencyTurnoverL13],
    [CurrencyBalanceYearToL1],
    [CurrencyBalanceYearToL2],
    [CurrencyBalanceYearToL3],
    [CurrencyBalanceYearToL4],
    [CurrencyBalanceYearToL5],
    [CurrencyBalanceYearToL6],
    [CurrencyBalanceYearToL7],
    [CurrencyBalanceYearToL8],
    [CurrencyBalanceYearToL9],
    [CurrencyBalanceYearToL10],
    [CurrencyBalanceYearToL11],
    [CurrencyBalanceYearToL12],
    [CurrencyBalanceYearToL13],
    [CurrencyTurnoverYearToL1],
    [CurrencyTurnoverYearToL2],
    [CurrencyTurnoverYearToL3],
    [CurrencyTurnoverYearToL4],
    [CurrencyTurnoverYearToL5],
    [CurrencyTurnoverYearToL6],
    [CurrencyTurnoverYearToL7],
    [CurrencyTurnoverYearToL8],
    [CurrencyTurnoverYearToL9],
    [CurrencyTurnoverYearToL10],
    [CurrencyTurnoverYearToL11],
    [CurrencyTurnoverYearToL12],
    [CurrencyTurnoverYearToL13],
    [TurnoverN1],
    [TurnoverN2],
    [TurnoverN3],
    [TurnoverN4],
    [TurnoverN5],
    [TurnoverN6],
    [TurnoverN7],
    [TurnoverN8],
    [TurnoverN9],
    [TurnoverN10],
    [TurnoverN11],
    [TurnoverN12],
    [TurnoverN13],
    [BalanceYearToN1],
    [BalanceYearToN2],
    [BalanceYearToN3],
    [BalanceYearToN4],
    [BalanceYearToN5],
    [BalanceYearToN6],
    [BalanceYearToN7],
    [BalanceYearToN8],
    [BalanceYearToN9],
    [BalanceYearToN10],
    [BalanceYearToN11],
    [BalanceYearToN12],
    [BalanceYearToN13],
    [TurnoverYearToN1],
    [TurnoverYearToN2],
    [TurnoverYearToN3],
    [TurnoverYearToN4],
    [TurnoverYearToN5],
    [TurnoverYearToN6],
    [TurnoverYearToN7],
    [TurnoverYearToN8],
    [TurnoverYearToN9],
    [TurnoverYearToN10],
    [TurnoverYearToN11],
    [TurnoverYearToN12],
    [TurnoverYearToN13],
    [CurrencyTurnoverN1],
    [CurrencyTurnoverN2],
    [CurrencyTurnoverN3],
    [CurrencyTurnoverN4],
    [CurrencyTurnoverN5],
    [CurrencyTurnoverN6],
    [CurrencyTurnoverN7],
    [CurrencyTurnoverN8],
    [CurrencyTurnoverN9],
    [CurrencyTurnoverN10],
    [CurrencyTurnoverN11],
    [CurrencyTurnoverN12],
    [CurrencyTurnoverN13],
    [CurrencyBalanceYearToN1],
    [CurrencyBalanceYearToN2],
    [CurrencyBalanceYearToN3],
    [CurrencyBalanceYearToN4],
    [CurrencyBalanceYearToN5],
    [CurrencyBalanceYearToN6],
    [CurrencyBalanceYearToN7],
    [CurrencyBalanceYearToN8],
    [CurrencyBalanceYearToN9],
    [CurrencyBalanceYearToN10],
    [CurrencyBalanceYearToN11],
    [CurrencyBalanceYearToN12],
    [CurrencyBalanceYearToN13],
    [CurrencyTurnoverYearToN1],
    [CurrencyTurnoverYearToN2],
    [CurrencyTurnoverYearToN3],
    [CurrencyTurnoverYearToN4],
    [CurrencyTurnoverYearToN5],
    [CurrencyTurnoverYearToN6],
    [CurrencyTurnoverYearToN7],
    [CurrencyTurnoverYearToN8],
    [CurrencyTurnoverYearToN9],
    [CurrencyTurnoverYearToN10],
    [CurrencyTurnoverYearToN11],
    [CurrencyTurnoverYearToN12],
    [CurrencyTurnoverYearToN13],
    [BudgetC1],
    [BudgetC2],
    [BudgetC3],
    [BudgetC4],
    [BudgetC5],
    [BudgetC6],
    [BudgetC7],
    [BudgetC8],
    [BudgetC9],
    [BudgetC10],
    [BudgetC11],
    [BudgetC12],
    [BudgetC13],
    [BudgetYearToC1],
    [BudgetYearToC2],
    [BudgetYearToC3],
    [BudgetYearToC4],
    [BudgetYearToC5],
    [BudgetYearToC6],
    [BudgetYearToC7],
    [BudgetYearToC8],
    [BudgetYearToC9],
    [BudgetYearToC10],
    [BudgetYearToC11],
    [BudgetYearToC12],
    [BudgetYearToC13],
    [BudgetL1],
    [BudgetL2],
    [BudgetL3],
    [BudgetL4],
    [BudgetL5],
    [BudgetL6],
    [BudgetL7],
    [BudgetL8],
    [BudgetL9],
    [BudgetL10],
    [BudgetL11],
    [BudgetL12],
    [BudgetL13],
    [BudgetYearToL1],
    [BudgetYearToL2],
    [BudgetYearToL3],
    [BudgetYearToL4],
    [BudgetYearToL5],
    [BudgetYearToL6],
    [BudgetYearToL7],
    [BudgetYearToL8],
    [BudgetYearToL9],
    [BudgetYearToL10],
    [BudgetYearToL11],
    [BudgetYearToL12],
    [BudgetYearToL13],
    [BudgetN1],
    [BudgetN2],
    [BudgetN3],
    [BudgetN4],
    [BudgetN5],
    [BudgetN6],
    [BudgetN7],
    [BudgetN8],
    [BudgetN9],
    [BudgetN10],
    [BudgetN11],
    [BudgetN12],
    [BudgetN13],
    [BudgetYearToN1],
    [BudgetYearToN2],
    [BudgetYearToN3],
    [BudgetYearToN4],
    [BudgetYearToN5],
    [BudgetYearToN6],
    [BudgetYearToN7],
    [BudgetYearToN8],
    [BudgetYearToN9],
    [BudgetYearToN10],
    [BudgetYearToN11],
    [BudgetYearToN12],
    [BudgetYearToN13]
)
WITH ENCRYPTION
AS
SELECT NULL AS [NullColumn]
--The script body was encrypted and cannot be reproduced here.;


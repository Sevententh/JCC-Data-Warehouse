CREATE VIEW dbo.UDEF_PWC_Audit
AS
SELECT        'JCC_PROD_LIVE' COLLATE DATABASE_DEFAULT AS 'Database', NCODE COLLATE DATABASE_DEFAULT AS 'GL_account', RTRIM(LTRIM(DET_HEADER_KEY)) 
                         + '-' + RTRIM(LTRIM(DET_NOM_PERSORT)) COLLATE DATABASE_DEFAULT AS 'Journal ID', HOME_DEBIT AS 'R_dr', HOME_CREDIT AS 'R_cr', DET_DATE_PUTIN AS 'cre_dt_time', CONVERT(VARCHAR(11), DET_DATE) 
                         AS 'eff_date', DET_NOM_PERIOD AS 'pd', DET_USER_PUTIN COLLATE DATABASE_DEFAULT AS 'user', DET_TYPE COLLATE DATABASE_DEFAULT AS 'doc_type', 
                         SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(DET_HEADER_REF, '£', ' '), '€', ' '), CHAR(10), ''), CHAR(13), ''), 1, 256) COLLATE DATABASE_DEFAULT AS 'Jnl_desc', 
                         SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(DET_JNL_LINEREF, '£', ' '), '€', ' '), CHAR(10), ''), CHAR(13), ''), 1, 256) COLLATE DATABASE_DEFAULT AS 'Line_no', 
                         SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(DET_DESCRIPTION, '£', ' '), '€', ' '), CHAR(10), ''), CHAR(13), ''), 1, 256) COLLATE DATABASE_DEFAULT AS 'Line_desc', DET_PRIMARY AS 'Audit No.'
FROM            dbo.AA_NOMINAL_TRAN_VIEW
WHERE        (DET_NOM_YEAR = 'C') AND (DET_BATCH_FLAG = '0')

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AA_NOMINAL_TRAN_VIEW"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UDEF_PWC_Audit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'UDEF_PWC_Audit';


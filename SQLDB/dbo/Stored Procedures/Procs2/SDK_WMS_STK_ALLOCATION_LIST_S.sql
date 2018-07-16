
create procedure  SDK_WMS_STK_ALLOCATION_LIST_S
/*
** Stored Procedure
**
** Written     :  28/04/14 NC
** Last Amended:  02/06/14 NC, 10/09/14 NC, 29/07/15 NC, 07/08/15 NC, 10/08/15 NC, 20/08/15 NC, 08/09/15 NC, 04/11/15 NC, 07/03/16 NC
**
*/
-- Declare all Parameters
   @PS_UserID                          varchar(4)                    -- Should always be compulsory (no default)
,  @PS_CalledFrom                      tinyint        = 0            -- 0 - List

-- Searches
,  @PS_OrderStatus                     varchar(20)    = null

,  @PS_RequiredByDateFrom              datetime       = null
,  @PS_RequiredByDateSearch            tinyint        = 0            -- 0 Range, 1 Begins, 2 Equal To, 3 Not Equal To, 4 Greater Than, 5 Less Than, 6 Exclude, 7 Empty String or Null
,  @PS_RequiredByDateTo                datetime       = null

,  @PS_OrderDateFrom                   datetime       = null
,  @PS_OrderDateSearch                 tinyint        = 0
,  @PS_OrderDateTo                     datetime       = null

-- Period
,  @PS_PeriodFrom                      tinyint        = null
,  @PS_PeriodSearch                    tinyint        = 0
,  @PS_PeriodTo                        tinyint        = null

,  @PS_Year                            varchar(1)     = null

-- Order Number
,  @PS_OrderNumberFrom                 int            = null
,  @PS_OrderNumberSearch               tinyint        = 0
,  @PS_OrderNumberTo                   int            = null

-- Batch Ref
,  @PS_BatchRefFrom                    varchar(10)    = null
,  @PS_BatchRefSearch                  tinyint        = 0
,  @PS_BatchRefTo                      varchar(10)    = null

-- Stock Code
,  @PS_StockCodeFrom                   varchar(25)    = null
,  @PS_StockCodeSearch                 tinyint        = 0
,  @PS_StockCodeTo                     varchar(25)    = null

-- Delta Site
,  @PS_Site                            varchar(25)    = null

-- Customer
,  @PS_CustomerFrom                    varchar(10)    = null
,  @PS_CustomerSearch                  tinyint        = 0
,  @PS_CustomerTo                      varchar(10)    = null

-- Delivery Postcode
,  @PS_DeliveryPostcodeFrom            varchar(12)    = null
,  @PS_DeliveryPostcodeSearch          tinyint        = 0
,  @PS_DeliveryPostcodeTo              varchar(12)    = null

-- Customer Sort Key
,  @PS_CustomerSortKeyFrom             varchar(20)    = null
,  @PS_CustomerSortKeySearch           tinyint        = 0
,  @PS_CustomerSortKeyTo               varchar(20)    = null

-- UserID
,  @PS_UserIDFrom                      varchar(4) =    null
,  @PS_UserIDSearch                    tinyint        = 0
,  @PS_UserIDTo                        varchar(4) =    null

-- User Key 1
,  @PS_UserKey1From                    varchar(20)    = null
,  @PS_UserKey1Search                  tinyint        = 0
,  @PS_UserKey1To                      varchar(20)    = null

-- User Key 2
,  @PS_UserKey2From                    varchar(20)    = null
,  @PS_UserKey2Search                  tinyint        = 0
,  @PS_UserKey2To                      varchar(20)    = null

-- User Key 3
,  @PS_UserKey3From                    varchar(20)    = null
,  @PS_UserKey3Search                  tinyint        = 0
,  @PS_UserKey3To                      varchar(20)    = null

,  @PS_IncludeAccountsOnStop           bit            = 0
,  @PS_IncludeCustomersOverCreditLimit bit            = 1
,  @PS_IncludeOrdersOnHold             bit            = 1
,  @PS_IncludeFullyAllocatedLines      bit            = 0

,  @PS_DoNotPartDeliveriesOnly         bit            = 0
,  @PS_UrgentOrdersOnly                bit            = 0
,  @PS_BackToBackOnly                  bit            = 0

,  @PS_Lock                            int            = 0      out   -- 0=no locking required, 1=lock orders, 2=unlock orders; output=number of orders that could not be fetched as locked to some body else.
,  @PS_ExtraSearchClause               varchar(2000)  = null

,  @PS_IncludeIncompleteWO             bit            = 1
,  @PS_OnlyShowLinesWithAvailableStock bit            = 0

-- Works Order search fields....
,  @PS_Include_SalesOrders             bit            = 1            -- this defaults to 1 to make the procedure compatible with before works orders was implemented, so it will work as it did before.
,  @PS_Include_WorksOrders             bit            = 0

-- Estimated Finish Date
,  @PS_FinishDateFrom                  datetime       = null
,  @PS_FinishDateSearch                tinyint        = 0
,  @PS_FinishDateTo                    datetime       = null

-- Top Level WO Number
,  @PS_TopLevelWONumberFrom            int            = null
,  @PS_TopLevelWONumberSearch          tinyint        = 0
,  @PS_TopLevelWONumberTo              int            = null

-- Works Order Number
,  @PS_WorksOrderNumberFrom            int            = null
,  @PS_WorksOrderNumberSearch          tinyint        = 0
,  @PS_WorksOrderNumberTo              int            = null

-- Assembly Stock Code
,  @PS_AssemblyStockCodeFrom           varchar(25)    = null
,  @PS_AssemblyStockCodeSearch         tinyint        = 0
,  @PS_AssemblyStockCodeTo             varchar(25)    = null

-- Component Stock Code
,  @PS_ComponentStockCodeFrom          varchar(25)    = null
,  @PS_ComponentStockCodeSearch        tinyint        = 0
,  @PS_ComponentStockCodeTo            varchar(25)    = null

-- Route Code
,  @PS_RouteCodeFrom                   varchar(10)    = null
,  @PS_RouteCodeSearch                 tinyint        = 0
,  @PS_RouteCodeTo                     varchar(10)    = null

-- Works Order Sort Key
,  @PS_WOSortKeyFrom                   varchar(20)    = null
,  @PS_WOSortKeySearch                 tinyint        = 0
,  @PS_WOSortKeyTo                     varchar(20)    = null

-- Order Priority
,  @PS_WOPriorityFrom                  int            = null
,  @PS_WOPrioritySearch                tinyint        = 0
,  @PS_WOPriorityTo                    int            = null

-- Other WO Search Fields:
,  @PS_WO_CustomerCodeFrom             varchar(10)    = null
,  @PS_WO_CustomerCodeSearch           tinyint        = 0
,  @PS_WO_CustomerCodeTo               varchar(10)    = null

,  @PS_WO_CustomerSortKeyFrom          varchar(20)    = null
,  @PS_WO_CustomerSortKeySearch        tinyint        = 0
,  @PS_WO_CustomerSortKeyTo            varchar(20)    = null

,  @PS_WO_CustomerUserKey1From         varchar(20)    = null
,  @PS_WO_CustomerUserKey1Search       tinyint        = 0
,  @PS_WO_CustomerUserKey1To           varchar(20)    = null

,  @PS_WO_CustomerUserKey2From         varchar(20)    = null
,  @PS_WO_CustomerUserKey2Search       tinyint        = 0
,  @PS_WO_CustomerUserKey2To           varchar(20)    = null

,  @PS_WO_CustomerUserKey3From         varchar(20)    = null
,  @PS_WO_CustomerUserKey3Search       tinyint        = 0
,  @PS_WO_CustomerUserKey3To           varchar(20)    = null

,  @PS_ComponentSite                   varchar(25)    = null

as

--the following is the fields populated for sales orders search
declare
   @LS_SOP_WhereClause            varchar(max)
,  @LS_SOP_SQLStatement           nvarchar(max)
,  @LS_SOP_CountSQLStatement      nvarchar(max)
,  @LS_SOP_TableNames             varchar(max)
,  @LS_SOP_Fields                 varchar(max)
,  @LS_SOP_PrimaryFieldName       varchar(20)
,  @LS_HideIfNoPhysical           tinyint
,  @LS_Locked                     int
--the following is the fields populated for works orders search
,  @LS_WO_WhereClause             varchar(max)
,  @LS_WO_SQLStatement            nvarchar(max)
,  @LS_WO_TableNames              varchar(max)
,  @LS_WO_Fields                  varchar(max)
,  @LS_WO_PrimaryFieldName        varchar(20)
,  @LS_WO_ExtraWhereClause        varchar(max)
,  @LS_WO_IncludeExtraWhereClause int
--the following is the field used to perform the search
,  @LS_Main_SQLStatement          nvarchar(max)
,  @LS_Allowed                    bit
,  @LS_ProcedureError             int
,  @LS_WMSS_DEFAULT_SITE          varchar(10)
,  @LS_WMSS_SITE_ANALYSIS         varchar(40)

select @LS_WMSS_DEFAULT_SITE  = WMSS_DEFAULT_SITE
   ,   @LS_WMSS_SITE_ANALYSIS = WMSS_SITE_ANALYSIS
   from SDK_WMS_SETTINGS where WMSS_PRIMARY = 1

if @PS_Include_SalesOrders = 1
   begin
      set @LS_SOP_PrimaryFieldName  = 'STKCODE'
      --Fields must always contain all the order by fields and
      --the specified primary as well as the list fields
      set                     -- select
         @LS_SOP_Fields       
            = ' ''S'''
            + ',OD_ORDER_NUMBER'
            + ',OD_PRIMARY'
            + ',OH_ACCOUNT_ORDER'
            + ',OD_STOCK_CODE as stockcode'
            + ',(OD_QTYORD-OD_QTYDELVD)*OD_QTYUNIT as ''quantity outstanding'''
            + ',OD_REQDATE'
            + ',OD_QTYORD*OD_QTYUNIT'
            + ',OD_QTYDELVD*OD_QTYUNIT'
            + ',OD_GROSS'
            + ',OH_DATE'
            + ',OH_URGENT_FLAG'
            + ',OH_PRIORITY'
            + ',OH_PRIMARY'
            + ',STKNAME'
      if @LS_WMSS_SITE_ANALYSIS <> ''
         set @LS_SOP_Fields   = @LS_SOP_Fields + char(13)
            + ',case STK_MULTILOCATN when 1 then isnull(SitePhsQty,0)
                   else STK_PHYSICAL + STK_QTYPRINTED 
                end as physical
               ,case STK_MULTILOCATN 
                  when 1 then isnull(ssr.AllocationQuantity,0) + isnull(swsr.AllocationQuantity,0)
                  else isnull(sr.AllocationQuantity,0) + isnull(swr.AllocationQuantity,0) 
                end'
      else
         set @LS_SOP_Fields   = @LS_SOP_Fields + char(13)
            + ',STK_PHYSICAL + STK_QTYPRINTED
               ,isnull(sr.AllocationQuantity,0) + isnull(swr.AllocationQuantity,0)'

      set @LS_SOP_Fields      = @LS_SOP_Fields + char(13)
            + ',STK_BIN_NUMBER
               ,CU_STOCK_ALLOCATION_PRIORITY
               ,oc.CUNAME
               ,isnull(WMR_QUANTITY,0)
               ,OD_QTYPRINTED*OD_QTYUNIT
               ,OD_QTYINVD*OD_QTYUNIT
               ,isnull(WMSPD_SITE,'''') as Site
               ,STK_MULTILOCATN
               ,ic.CU_ON_STOP
               ,WMSPD_HOLD_REF as OrderHoldRef
               ,isnull(HoldQty,0) as HoldQty
               ,isnull(case when AllocHoldQty > HoldQty then HoldQty else AllocHoldQty end, 0) as AllocHoldQty
               ,isnull(HoldRefQty,0) as HoldRefQty
               ,isnull(AllocHoldRefQty, 0) + isnull(WoAllocHoldQty, 0) as AllocHoldRefQty
               ,OH_NO_PARTDEL
              '
                              --    from
      set @LS_SOP_TableNames  
            = ' ORD_HEADER'
            + ' inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER'
            + ' inner join SL_ACCOUNTS as oc on oc.CU_ACC_CODE=OH_ACCOUNT_ORDER'
            + ' inner join SL_ACCOUNTS as ic on ic.CU_ACC_CODE=OH_ACCOUNT'
            + ' inner join SL_ACCOUNTS2 on CU_PRIMARY_2=oc.CU_PRIMARY'
            + ' inner join SYS_DATAINFO on SYS_PRIMARY = 1'
            + ' inner join STK_STOCK on STKCODE=OD_STOCK_CODE and dbo.AA_SYS_CHECK_RECORD_LEVELS_F(9,''T'',STK_LEVEL,@PS_UserID)=1'
            + ' left join SL_TERMS on SLT_PRIMARY = ic.CU_TERMS_LINK and ic.CU_CUSTOM_TERMS_TEMPLATE = 0'
            + ' left join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP'''
            + ' left join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY'
            + ' left join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY'
            + ' left join SDK_WMS_STOCK_RESERVATION_VIEW sr on sr.StockLink = STK_PRIMARY'
            + ' left join SDK_WMS_STOCK_WO_RESERVATION_VIEW swr on swr.StockLink = STK_PRIMARY'

      if @LS_WMSS_SITE_ANALYSIS <> ''
         set @LS_SOP_TableNames = @LS_SOP_TableNames + char(13)
            + ' left join SDK_WMS_STOCK_SITE_RESERVATION_VIEW ssr on ssr.StockLink = STK_PRIMARY and ssr.Site = WMSPD_SITE'
            + ' left join SDK_WMS_STOCK_WO_SITE_RESERVATION_VIEW swsr on swsr.StockLink = STK_PRIMARY and swsr.Site = WMSPD_SITE'

      if @LS_WMSS_SITE_ANALYSIS <> ''
         begin
            set @LS_SOP_TableNames = @LS_SOP_TableNames + char(13)
            + ' left join (select isnull(sum(LOC_PHYSICAL + LOC_QTYPRINTED),0) SitePhsQty, LOC_STOCK_CODE stk, ' + @LS_WMSS_SITE_ANALYSIS + ' StkSite from STK_LOCATION 
                              group by LOC_STOCK_CODE, ' + @LS_WMSS_SITE_ANALYSIS + ' ) StkSiteQtys on StkSiteQtys.stk = STKCODE and StkSiteQtys.StkSite = WMSPD_SITE
                left join
                ( select isnull(
                                sum(case 
                                       when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then HoldQty 
                                       else isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0)
                                    end
                               ),0) as AllocHoldQty
                      , sum(HoldQty) as HoldQty
                      , HoldStkCode
                      , isnull(HoldSite,'''') as HoldSite
                  from          
                   ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) as HoldQty
                     ,OD_STOCK_CODE as HoldStkCode
                     ,' + @LS_WMSS_SITE_ANALYSIS + ' as HoldSite
                     ,OD_USRCHAR3 as HoldRef
                     ,case when min(OD_LOCATN) <> '''' then 1 else 0 end HasSubAnalysis
                     from ORD_HEADER 
                        join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                        join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                        left join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                     where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                     group by OD_STOCK_CODE, ' + @LS_WMSS_SITE_ANALYSIS + ',OD_USRCHAR3
                   ) HoldStock

                   left join
                  ( select sum(WMR_QUANTITY) AllocHoldQty
                        , OD_STOCK_CODE      AllocHoldStkCode
                        , WMSPD_SITE         AllocHoldSite
                        , WMSPD_HOLD_REF     AllocHoldRef
                        from ORD_HEADER 
                           inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                           join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                        where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                        group by OD_STOCK_CODE,WMSPD_SITE,WMSPD_HOLD_REF
                  ) AllocHoldStock
                     on AllocHoldStkCode = HoldStkCode and (AllocHoldSite = HoldSite or HasSubAnalysis = 0) and AllocHoldRef = HoldRef

                   left join
                  ( select sum(WMWR_QUANTITY) WoAllocHoldQty
                        , STKCODE             WoAllocHoldStkCode
                        , WMSPD_SITE          WoAllocHoldSite
                        , WMSPD_HOLD_REF      WoAllocHoldRef
                        from WO_ORDERS
                           inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                           inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                           join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                        where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                        group by STKCODE,WMSPD_SITE,WMSPD_HOLD_REF
                  ) WoAllocHoldStock
                     on WoAllocHoldStkCode = HoldStkCode and (WoAllocHoldSite = HoldSite or HasSubAnalysis = 0) and WoAllocHoldRef = HoldRef

                 group by HoldStkCode, HoldSite
               ) as HeldStk on HoldStkCode = OD_STOCK_CODE and (HoldSite = WMSPD_SITE or HoldSite = '''')

                left join
               ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) HoldRefQty
                  ,OD_STOCK_CODE HoldRefStkCode
                  ,' + @LS_WMSS_SITE_ANALYSIS + ' HoldRefSite
                  ,OD_USRCHAR3 HoldRef
                  from ORD_HEADER 
                     join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                     join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                     left join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                  where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                  group by OD_STOCK_CODE, OD_USRCHAR3, ' + @LS_WMSS_SITE_ANALYSIS + '
               ) HoldRefStock 
                     on HoldRefStkCode = OD_STOCK_CODE and (HoldRefSite = WMSPD_SITE or HoldRefSite is null)
                        and HoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMR_QUANTITY) AllocHoldRefQty
                     , OD_STOCK_CODE      AllocHoldRefStkCode
                     , WMSPD_SITE         AllocHoldRefSite
                     , WMSPD_HOLD_REF     AllocHoldRef
                     from ORD_HEADER 
                        inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                        join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                     where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                     group by OD_STOCK_CODE,WMSPD_SITE,WMSPD_HOLD_REF
               ) AllocHoldRefStock
                  on AllocHoldRefStkCode = OD_STOCK_CODE and (AllocHoldRefSite = WMSPD_SITE or STK_MULTILOCATN = 0)
                     and AllocHoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMWR_QUANTITY) WoAllocHoldQty
                     , STKCODE             WoAllocHoldStkCode
                     , WMSPD_SITE          WoAllocHoldSite
                     , WMSPD_HOLD_REF      WoAllocHoldRef
                     from WO_ORDERS
                        inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                        inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                        join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                     where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                     group by STKCODE,WMSPD_SITE,WMSPD_HOLD_REF
               ) WoAllocHoldStock
                  on WoAllocHoldStkCode = OD_STOCK_CODE and (WoAllocHoldSite = WMSPD_SITE or STK_MULTILOCATN = 0)
                     and WoAllocHoldRef = WMSPD_HOLD_REF
            '
         end
      else
         begin
            set @LS_SOP_TableNames = @LS_SOP_TableNames
            + ' left join
                ( select isnull(
                                sum(case 
                                       when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then HoldQty 
                                       else isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0)
                                    end
                               ),0) as AllocHoldQty
                      , sum(HoldQty) as HoldQty
                      , HoldStkCode
                  from          
                   ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) as HoldQty
                     ,OD_STOCK_CODE as HoldStkCode
                     ,OD_USRCHAR3 as HoldRef
                     from ORD_HEADER 
                        join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                        join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                     where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                     group by OD_STOCK_CODE, OD_USRCHAR3
                   ) HoldStock 
                   left join
                  ( select sum(WMR_QUANTITY) AllocHoldQty
                        , OD_STOCK_CODE      AllocHoldStkCode
                        , WMSPD_HOLD_REF     AllocHoldRef
                        from ORD_HEADER 
                           inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                           join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                        where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                        group by OD_STOCK_CODE, WMSPD_HOLD_REF
                  ) AllocHoldStock
                     on AllocHoldStkCode = HoldStkCode and AllocHoldRef = HoldRef
                   left join
                  ( select sum(WMWR_QUANTITY) WoAllocHoldQty
                        , STKCODE             WoAllocHoldStkCode
                        , WMSPD_HOLD_REF      WoAllocHoldRef
                        from WO_ORDERS
                           inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                           inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                           join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                        where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                        group by STKCODE,WMSPD_HOLD_REF
                  ) WoAllocHoldStock
                     on WoAllocHoldStkCode = HoldStkCode and WoAllocHoldRef = HoldRef
                 group by HoldStkCode
               ) as HeldStk on HoldStkCode = OD_STOCK_CODE

                left join
               ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) HoldRefQty
                  ,OD_STOCK_CODE HoldRefStkCode
                  ,OD_USRCHAR3 HoldRef
                  from ORD_HEADER 
                     join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                     join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                     left join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                  where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                  group by OD_STOCK_CODE, OD_USRCHAR3
               ) HoldRefStock 
                     on HoldRefStkCode = OD_STOCK_CODE
                        and HoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMR_QUANTITY) AllocHoldRefQty
                     , OD_STOCK_CODE      AllocHoldRefStkCode
                     , WMSPD_HOLD_REF     AllocHoldRef
                     from ORD_HEADER 
                        inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                        join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                     where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                     group by OD_STOCK_CODE,WMSPD_HOLD_REF
               ) AllocHoldRefStock
                  on AllocHoldRefStkCode = OD_STOCK_CODE
                     and AllocHoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMWR_QUANTITY) WoAllocHoldQty
                     , STKCODE             WoAllocHoldStkCode
                     , WMSPD_HOLD_REF      WoAllocHoldRef
                     from WO_ORDERS
                        inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                        inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                        join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                     where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                     group by STKCODE,WMSPD_HOLD_REF
               ) WoAllocHoldStock
                  on WoAllocHoldStkCode = OD_STOCK_CODE
                     and WoAllocHoldRef = WMSPD_HOLD_REF
            '
         end
                              --    where
      set @LS_SOP_WhereClause  = ' OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3'
               + ' and isnull(OH_BATCH_REF,'''') <> ''ONHOLD-ZZ''' -- Exclude the special on hold order.

      if isnull(@PS_OrderStatus,'') <> ''
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and OH_WORK_STATUS=@PS_OrderStatus'

      select
         @PS_RequiredByDateFrom  = nullif(@PS_RequiredByDateFrom,'')
      ,  @PS_RequiredByDateTo    = nullif(@PS_RequiredByDateTo,'')

      if @PS_RequiredByDateSearch <> 7 and (@PS_RequiredByDateFrom is not null or @PS_RequiredByDateTo is not null)
         begin
            if @PS_RequiredByDateSearch = 0 and @PS_RequiredByDateFrom is null
               set @PS_RequiredByDateSearch = 5

            if @PS_RequiredByDateSearch = 0 and @PS_RequiredByDateTo is null
               set @PS_RequiredByDateSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_RequiredByDateSearch
                     when 0 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_REQDATE) between @PS_RequiredByDateFrom and @PS_RequiredByDateTo'
                     when 2 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_REQDATE) = @PS_RequiredByDateFrom'
                     when 3 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_REQDATE) <> @PS_RequiredByDateFrom'
                     when 4 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_REQDATE) >= @PS_RequiredByDateFrom'
                     when 5 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_REQDATE) <= @PS_RequiredByDateTo'
                     when 6 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_REQDATE) not between @PS_RequiredByDateFrom and @PS_RequiredByDateTo'
                     when 7 then ' and OD_REQDATE is null'
                     else
                        ''
                  end
         end

      select
         @PS_OrderDateFrom = nullif(@PS_OrderDateFrom,'')
      ,  @PS_OrderDateTo   = nullif(@PS_OrderDateTo,'')

      if @PS_OrderDateSearch <> 7 and (@PS_OrderDateFrom is not null or @PS_OrderDateTo is not null)
         begin
            if @PS_OrderDateSearch = 0 and @PS_OrderDateFrom is null
               set @PS_OrderDateSearch = 5
            if @PS_OrderDateSearch = 0 and @PS_OrderDateTo is null
               set @PS_OrderDateSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_OrderDateSearch
                     when 0 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_DATE) between @PS_OrderDateFrom and @PS_OrderDateTo'
                     when 2 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_DATE) = @PS_OrderDateFrom'
                     when 3 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_DATE) <> @PS_OrderDateFrom'
                     when 4 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_DATE) >= @PS_OrderDateFrom'
                     when 5 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_DATE) <= @PS_OrderDateTo'
                     when 6 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(OD_DATE) not between @PS_OrderDateFrom and @PS_OrderDateTo'
                     when 7 then ' and OD_DATE is null'
                     else
                        ''
                  end
         end

      select
         @PS_PeriodFrom = nullif(@PS_PeriodFrom,'')
      ,  @PS_PeriodTo   = nullif(@PS_PeriodTo,'')

      if @PS_PeriodSearch <> 7 and (@PS_PeriodFrom is not null or @PS_PeriodTo is not null)
         begin
            if @PS_PeriodSearch = 0 and @PS_PeriodFrom is null
               set @PS_PeriodSearch = 5

            if @PS_PeriodSearch = 0 and @PS_PeriodTo is null
               set @PS_PeriodSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_PeriodSearch
                     when 0 then ' and OH_PERIOD between @PS_PeriodFrom and @PS_PeriodTo'
                     when 2 then ' and OH_PERIOD = @PS_PeriodFrom'
                     when 3 then ' and OH_PERIOD <> @PS_PeriodFrom'
                     when 4 then ' and OH_PERIOD >= @PS_PeriodFrom'
                     when 5 then ' and OH_PERIOD <= @PS_PeriodTo'
                     when 6 then ' and OH_PERIOD not between @PS_PeriodFrom and @PS_PeriodTo'
                     when 7 then ' and OH_PERIOD is null'
                     else
                        ''
                  end
         end

      if isnull(@PS_Year,'') <> '' and @PS_Year <> 'A'
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and OH_YEAR = @PS_Year'

      select
         @PS_OrderNumberFrom  = nullif(@PS_OrderNumberFrom,'')
      ,  @PS_OrderNumberTo    = nullif(@PS_OrderNumberTo,'')

      if @PS_OrderNumberSearch <> 7 and (@PS_OrderNumberFrom is not null or @PS_OrderNumberTo is not null)
         begin
            if @PS_OrderNumberSearch = 0 and @PS_OrderNumberFrom is null
               set @PS_OrderNumberSearch = 5

            if @PS_OrderNumberSearch = 0 and @PS_OrderNumberTo is null
               set @PS_OrderNumberSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_OrderNumberSearch
                     when 0 then ' and OD_ORDER_NUMBER between @PS_OrderNumberFrom and @PS_OrderNumberTo'
                     when 1 then ' and convert(varchar,OD_ORDER_NUMBER) like convert(varchar,@PS_OrderNumberFrom) + ''%'''
                     when 2 then ' and OD_ORDER_NUMBER = @PS_OrderNumberFrom'
                     when 3 then ' and OD_ORDER_NUMBER <> @PS_OrderNumberFrom'
                     when 4 then ' and OD_ORDER_NUMBER >= @PS_OrderNumberFrom'
                     when 5 then ' and OD_ORDER_NUMBER <= @PS_OrderNumberTo'
                     when 6 then ' and OD_ORDER_NUMBER not between @PS_OrderNumberFrom and @PS_OrderNumberTo'
                     when 7 then ' and OD_ORDER_NUMBER is null'
                     else
                        ''
                  end
         end

      select
         @PS_BatchRefFrom  = nullif(@PS_BatchRefFrom,'')
      ,  @PS_BatchRefTo    = nullif(@PS_BatchRefTo,'')

      if @PS_BatchRefSearch <> 7 and (@PS_BatchRefFrom is not null or @PS_BatchRefTo is not null)
         begin
            if @PS_BatchRefSearch = 0 and @PS_BatchRefFrom is null
               set @PS_BatchRefSearch = 5

            if @PS_BatchRefSearch = 0 and @PS_BatchRefTo is null
               set @PS_BatchRefSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_BatchRefSearch
                     when 0 then ' and OH_BATCH_REF between @PS_BatchRefFrom and @PS_BatchRefTo'
                     when 1 then ' and convert(varchar,OH_BATCH_REF) like convert(varchar,@PS_BatchRefFrom) + ''%'''
                     when 2 then ' and OH_BATCH_REF = @PS_BatchRefFrom'
                     when 3 then ' and OH_BATCH_REF <> @PS_BatchRefFrom'
                     when 4 then ' and OH_BATCH_REF >= @PS_BatchRefFrom'
                     when 5 then ' and OH_BATCH_REF <= @PS_BatchRefTo'
                     when 6 then ' and OH_BATCH_REF not between @PS_BatchRefFrom and @PS_BatchRefTo'
                     when 7 then ' and isnull(OH_BATCH_REF,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_StockCodeFrom = nullif(@PS_StockCodeFrom,'')
      ,  @PS_StockCodeTo   = nullif(@PS_StockCodeTo,'')

      if @PS_StockCodeSearch <> 7 and (@PS_StockCodeFrom is not null or @PS_StockCodeTo is not null)
         begin
            if @PS_StockCodeSearch = 0 and @PS_StockCodeFrom is null
               set @PS_StockCodeSearch = 5

            if @PS_StockCodeSearch = 0 and @PS_StockCodeTo is null
               set @PS_StockCodeSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_StockCodeSearch
                     when 0 then ' and OD_STOCK_CODE between @PS_StockCodeFrom and @PS_StockCodeTo'
                     when 1 then ' and convert(varchar,OD_STOCK_CODE) like convert(varchar,@PS_StockCodeFrom) + ''%'''
                     when 2 then ' and OD_STOCK_CODE = @PS_StockCodeFrom'
                     when 3 then ' and OD_STOCK_CODE <> @PS_StockCodeFrom'
                     when 4 then ' and OD_STOCK_CODE >= @PS_StockCodeFrom'
                     when 5 then ' and OD_STOCK_CODE <= @PS_StockCodeTo'
                     when 6 then ' and OD_STOCK_CODE not between @PS_StockCodeFrom and @PS_StockCodeTo'
                     when 7 then ' and isnull(OD_STOCK_CODE,'''') = '''''
                     else
                        ''
                  end
         end

      select @PS_Site = nullif(@PS_Site,'')

      if @PS_Site is not null and @PS_Site <> ''
         begin
            if @PS_Site = @LS_WMSS_DEFAULT_SITE

               set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and (WMSPD_SITE = @PS_Site or WMSPD_SITE is null)'      
            else
               set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and WMSPD_SITE = @PS_Site'
         end

      select
         @PS_CustomerFrom  = nullif(@PS_CustomerFrom,'')
      ,  @PS_CustomerTo    = nullif(@PS_CustomerTo,'')

      if @PS_CustomerSearch <> 7 and (@PS_CustomerFrom is not null or @PS_CustomerTo is not null)
         begin
            if @PS_CustomerSearch = 0 and @PS_CustomerFrom is null
               set @PS_CustomerSearch = 5

            if @PS_CustomerSearch = 0 and @PS_CustomerTo is null
               set @PS_CustomerSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_CustomerSearch
                     when 0 then ' and OH_ACCOUNT_DELIVERY between @PS_CustomerFrom and @PS_CustomerTo'
                     when 1 then ' and OH_ACCOUNT_DELIVERY like @PS_CustomerFrom + ''%'''
                     when 2 then ' and OH_ACCOUNT_DELIVERY = @PS_CustomerFrom'
                     when 3 then ' and OH_ACCOUNT_DELIVERY <> @PS_CustomerFrom'
                     when 4 then ' and OH_ACCOUNT_DELIVERY >= @PS_CustomerFrom'
                     when 5 then ' and OH_ACCOUNT_DELIVERY <= @PS_CustomerTo'
                     when 6 then ' and OH_ACCOUNT_DELIVERY not between @PS_CustomerFrom and @PS_CustomerTo'
                     when 7 then ' and isnull(OH_ACCOUNT_DELIVERY,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_DeliveryPostcodeFrom   = nullif(@PS_DeliveryPostcodeFrom,'')
      ,  @PS_DeliveryPostcodeTo     = nullif(@PS_DeliveryPostcodeTo,'')

      if @PS_DeliveryPostcodeSearch <> 7 and (@PS_DeliveryPostcodeFrom is not null or @PS_DeliveryPostcodeTo is not null)
         begin
            if @PS_DeliveryPostcodeSearch = 0 and @PS_DeliveryPostcodeFrom is null
               set @PS_DeliveryPostcodeSearch = 5

            if @PS_DeliveryPostcodeSearch = 0 and @PS_DeliveryPostcodeTo is null
               set @PS_DeliveryPostcodeSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  + ' and exists (select 1 from SL_ADDRESSES where AD_POSTCODE'
                  +
                  case @PS_DeliveryPostcodeSearch
                     when 0 then ' between @PS_DeliveryPostcodeFrom and @PS_DeliveryPostcodeTo'
                     when 1 then ' like @PS_DeliveryPostcodeFrom + ''%'''
                     when 2 then ' = @PS_DeliveryPostcodeFrom'
                     when 3 then ' <> @PS_DeliveryPostcodeFrom'
                     when 4 then ' >= @PS_DeliveryPostcodeFrom'
                     when 5 then ' <= @PS_DeliveryPostcodeTo'
                     when 6 then ' not between @PS_DeliveryPostcodeFrom and @PS_DeliveryPostcodeTo'
                     when 7 then ' is null or AD_POSTCODE = '''''
                     else
                        ''
                  end
                  + ' and AD_CON_CODE=convert(char(10),isnull(nullif(OH_ACCOUNT_DELIVERY,''''),OH_ACCOUNT))+convert(varchar,OH_DEL_ADD)'
                  + ')'
         end

      select
         @PS_CustomerSortKeyFrom = nullif(@PS_CustomerSortKeyFrom,'')
      ,  @PS_CustomerSortKeyTo   = nullif(@PS_CustomerSortKeyTo,'')

      if @PS_CustomerSortKeySearch <> 7 and (@PS_CustomerSortKeyFrom is not null or @PS_CustomerSortKeyTo is not null)
         begin
            if @PS_CustomerSortKeySearch = 0 and @PS_CustomerSortKeyFrom is null
               set @PS_CustomerSortKeySearch = 5

            if @PS_CustomerSortKeySearch = 0 and @PS_CustomerSortKeyTo is null
               set @PS_CustomerSortKeySearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_CustomerSortKeySearch
                     when 0 then ' and oc.CUSORT between @PS_CustomerSortKeyFrom and @PS_CustomerSortKeyTo'
                     when 1 then ' and oc.CUSORT like @PS_CustomerSortKeyFrom + ''%'''
                     when 2 then ' and oc.CUSORT = @PS_CustomerSortKeyFrom'
                     when 3 then ' and oc.CUSORT <> @PS_CustomerSortKeyFrom'
                     when 4 then ' and oc.CUSORT >= @PS_CustomerSortKeyFrom'
                     when 5 then ' and oc.CUSORT <= @PS_CustomerSortKeyTo'
                     when 6 then ' and oc.CUSORT not between @PS_CustomerSortKeyFrom and @PS_CustomerSortKeyTo'
                     when 7 then ' and isnull(oc.CUSORT,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_UserIDFrom = nullif(@PS_UserIDFrom,'')
      ,  @PS_UserIDTo   = nullif(@PS_UserIDTo,'')

      if @PS_UserIDSearch <> 7 and (@PS_UserIDFrom is not null or @PS_UserIDTo is not null)
         begin
            if @PS_UserIDSearch = 0 and @PS_UserIDFrom is null
               set @PS_UserIDSearch = 5

            if @PS_UserIDSearch = 0 and @PS_UserIDTo is null
               set @PS_UserIDSearch = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_UserIDSearch
                     when 0 then ' and OH_USER_PUTIN between @PS_UserIDFrom and @PS_UserIDTo'
                     when 1 then ' and OH_USER_PUTIN like @PS_UserIDFrom + ''%'''
                     when 2 then ' and OH_USER_PUTIN = @PS_UserIDFrom'
                     when 3 then ' and OH_USER_PUTIN <> @PS_UserIDFrom'
                     when 4 then ' and OH_USER_PUTIN >= @PS_UserIDFrom'
                     when 5 then ' and OH_USER_PUTIN <= @PS_UserIDTo'
                     when 6 then ' and OH_USER_PUTIN not between @PS_UserIDFrom and @PS_UserIDTo'
                     when 7 then ' and isnull(OH_USER_PUTIN,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_UserKey1From  = nullif(@PS_UserKey1From,'')
      ,  @PS_UserKey1To    = nullif(@PS_UserKey1To,'')

      if @PS_UserKey1Search <> 7 and (@PS_UserKey1From is not null or @PS_UserKey1To is not null)
         begin
            if @PS_UserKey1Search = 0 and @PS_UserKey1From is null
               set @PS_UserKey1Search = 5

            if @PS_UserKey1Search = 0 and @PS_UserKey1To is null
               set @PS_UserKey1Search = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_UserKey1Search
                     when 0 then ' and OH_USER1 between @PS_UserKey1From and @PS_UserKey1To'
                     when 1 then ' and OH_USER1 like @PS_UserKey1From + ''%'''
                     when 2 then ' and OH_USER1 = @PS_UserKey1From'
                     when 3 then ' and OH_USER1 <> @PS_UserKey1From'
                     when 4 then ' and OH_USER1 >= @PS_UserKey1From'
                     when 5 then ' and OH_USER1 <= @PS_UserKey1To'
                     when 6 then ' and OH_USER1 not between @PS_UserKey1From and @PS_UserKey1To'
                     when 7 then ' and isnull(OH_USER1,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_UserKey2From  = nullif(@PS_UserKey2From,'')
      ,  @PS_UserKey2To    = nullif(@PS_UserKey2To,'')

      if @PS_UserKey2Search <> 7 and (@PS_UserKey2From is not null or @PS_UserKey2To is not null)
         begin
            if @PS_UserKey2Search = 0 and @PS_UserKey2From is null
               set @PS_UserKey2Search = 5

            if @PS_UserKey2Search = 0 and @PS_UserKey2To is null
               set @PS_UserKey2Search = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_UserKey2Search
                     when 0 then ' and OH_USER2 between @PS_UserKey2From and @PS_UserKey2To'
                     when 1 then ' and OH_USER2 like @PS_UserKey2From + ''%'''
                     when 2 then ' and OH_USER2 = @PS_UserKey2From'
                     when 3 then ' and OH_USER2 <> @PS_UserKey2From'
                     when 4 then ' and OH_USER2 >= @PS_UserKey2From'
                     when 5 then ' and OH_USER2 <= @PS_UserKey2To'
                     when 6 then ' and OH_USER2 not between @PS_UserKey2From and @PS_UserKey2To'
                     when 7 then ' and isnull(OH_USER2,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_UserKey3From  = nullif(@PS_UserKey3From,'')
      ,  @PS_UserKey3To    = nullif(@PS_UserKey3To,'')

      if @PS_UserKey3Search <> 7 and (@PS_UserKey3From is not null or @PS_UserKey3To is not null)
         begin
            if @PS_UserKey3Search = 0 and @PS_UserKey3From is null
               set @PS_UserKey3Search = 5

            if @PS_UserKey3Search = 0 and @PS_UserKey3To is null
               set @PS_UserKey3Search = 4

            set   @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  +
                  case @PS_UserKey3Search
                     when 0 then ' and OH_USER3 between @PS_UserKey3From and @PS_UserKey3To'
                     when 1 then ' and OH_USER3 like @PS_UserKey3From + ''%'''
                     when 2 then ' and OH_USER3 = @PS_UserKey3From'
                     when 3 then ' and OH_USER3 <> @PS_UserKey3From'
                     when 4 then ' and OH_USER3 >= @PS_UserKey3From'
                     when 5 then ' and OH_USER3 <= @PS_UserKey3To'
                     when 6 then ' and OH_USER3 not between @PS_UserKey3From and @PS_UserKey3To'
                     when 7 then ' and isnull(OH_USER3,'''') = '''''
                     else
                        ''
                  end
         end

      if @PS_IncludeAccountsOnStop = 0 or @PS_IncludeAccountsOnStop is null
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and ic.CU_ON_STOP = 0'

      if @PS_IncludeCustomersOverCreditLimit = 0 or @PS_IncludeCustomersOverCreditLimit is null
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
            + ' and ('
            + 'case when ic.CUCURRENCYCODE<>HOME_CURR_SYMBL and ic.CU_MULTI_CURR = 0 and ic.CU_CURR_CREDIT_LIMIT<>0
                  then (case when ic.CUBALANCE_C <= ic.CU_CURR_CREDIT_LIMIT then 1 else 0 end)
                  when isnull(SLT_CREDIT_LIMIT,ic.CU_CREDIT_LIMIT)=0
                  then 1
                  else (case when (isnull(SLT_CREDIT_LIMIT,ic.CU_CREDIT_LIMIT)>=ic.CUBALANCE) then 1 else 0 end)'+
            + ' end = 1'      
            +')'

      if @PS_IncludeOrdersOnHold = 0 or @PS_IncludeOrdersOnHold is null
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and (select TXT_TYPE from SYS_LOOKUP_TEXT where TXT_USER_TEXT=OH_WORK_STATUS and TXT_ORIGIN=''SOP'')>0'

      if @PS_IncludeFullyAllocatedLines = 0 or @PS_IncludeFullyAllocatedLines is null
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and ((OD_QTYORD-OD_QTYDELVD)*OD_QTYUNIT) - isnull(WMR_QUANTITY,0) >=  (0.5/power(10,QUANTITY_DPS))'

      if @PS_DoNotPartDeliveriesOnly = 1
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and OH_NO_PARTDEL=1'

      if @PS_UrgentOrdersOnly = 1
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and OH_URGENT_FLAG=1'

      if @PS_BackToBackOnly = 1
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and OD_RTP_FLAG=1'

      if @PS_IncludeIncompleteWO = 0 or @PS_IncludeIncompleteWO is null    --only include sales orders not linked to works orders, or linked to complete/cancelled works orders
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + ' and (isnull(OD_WO_NUMBER,0)=0 or (isnull(OD_WO_NUMBER,0) in(select WO_ORDER_NUMBER from WO_ORDERS where WO_ORDER_NUMBER=OD_WO_NUMBER and (WO_STATUS=10 or WO_STATUS=15)))) '

      -- Available Stock calc:
      -- if no hold ref on order then available = physical - allocated - hold quantity + allocated held quantity
      -- if hold ref on order then available = max (min (physical - allocated, holdRefQuantity - HoldAllocquantity)
      --                   , physical - allocated - hold quantity + allocated held quantity)

      if @PS_OnlyShowLinesWithAvailableStock = 1 and @LS_WMSS_SITE_ANALYSIS <> ''
      begin
         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
         + ' and 
               ((
                (case STK_MULTILOCATN 
                     when 1 then isnull(SitePhsQty,0) - isnull(ssr.AllocationQuantity,0) - isnull(swsr.AllocationQuantity,0)
                     else STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                  end
                  - isnull(HoldQty,0)
                  + isnull(case when AllocHoldQty > HoldQty then HoldQty else AllocHoldQty end,0)
                 >=  (0.5/power(10,QUANTITY_DPS))
                )
               or
               (WMSPD_HOLD_REF <> ''''
                  and 
                     case STK_MULTILOCATN 
                        when 1 then isnull(SitePhsQty,0) - isnull(ssr.AllocationQuantity,0) - isnull(swsr.AllocationQuantity,0)
                        else STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                     end
                     >=  (0.5/power(10,QUANTITY_DPS))
                  and 
                     isnull(HoldRefQty,0) - isnull(AllocHoldRefQty,0) >=  (0.5/power(10,QUANTITY_DPS))
                )
               )'
         if @PS_IncludeFullyAllocatedLines = 1
            set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
               + ' or ( ((OD_QTYORD-OD_QTYDELVD)*OD_QTYUNIT) - isnull(WMR_QUANTITY,0) <=  (0.5/power(10,QUANTITY_DPS)) )'

         set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + 
             + ')'
      end

      if @PS_OnlyShowLinesWithAvailableStock = 1 and isnull(@LS_WMSS_SITE_ANALYSIS,'') = ''
         begin
            set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
            + ' and 
                  ((
                   (STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                     - isnull(HoldQty,0)
                     + isnull(case when AllocHoldQty > HoldQty then HoldQty else AllocHoldQty end,0)
                    >=  (0.5/power(10,QUANTITY_DPS))
                   )
                  or
                  (WMSPD_HOLD_REF <> ''''
                     and 
                        STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                        >=  (0.5/power(10,QUANTITY_DPS))
                     and 
                        isnull(HoldRefQty,0) - isnull(AllocHoldRefQty,0) >=  (0.5/power(10,QUANTITY_DPS))
                   )
                  )'
            if @PS_IncludeFullyAllocatedLines = 1
               set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13)
                  + ' or ( ((OD_QTYORD-OD_QTYDELVD)*OD_QTYUNIT) - isnull(WMR_QUANTITY,0) <=  (0.5/power(10,QUANTITY_DPS)) )'

            set @LS_SOP_WhereClause = @LS_SOP_WhereClause + char(13) + 
                + ')'
         end

      if @PS_ExtraSearchClause is null
         set @PS_ExtraSearchClause = ''

      set @LS_SOP_SQLStatement   =  'select'
                                 +  ' @LS_Locked=count(*)'
                                 +  ' from'
                                 +  ' ORD_HEADER'
                                 +  ' where'
                                 +  ' OH_ORDER_NUMBER'
                                 +  ' in(select OH_ORDER_NUMBER from '+@LS_SOP_TableNames+' where '+@LS_SOP_WhereClause+@PS_ExtraSearchClause+' and (OH_MU_STATUS<>'''' or OH_MU_LOCK<>0) and isnull(OH_MU_USER,'''')<>@PS_UserID)'
      execute sp_executesql
         @LS_SOP_SQLStatement
      ,  N'    @PS_OrderStatus            varchar(20)
            ,  @PS_RequiredByDateFrom     datetime
            ,  @PS_RequiredByDateTo       datetime
            ,  @PS_OrderDateFrom          datetime
            ,  @PS_OrderDateTo            datetime
            ,  @PS_PeriodFrom             tinyint
            ,  @PS_PeriodTo               tinyint
            ,  @PS_Year                   varchar(1)
            ,  @PS_OrderNumberFrom        int
            ,  @PS_OrderNumberTo          int
            ,  @PS_BatchRefFrom           varchar(10)
            ,  @PS_BatchRefTo             varchar(10)
            ,  @PS_StockCodeFrom          varchar(25)
            ,  @PS_StockCodeTo            varchar(25)
            ,  @PS_Site                   varchar(25)
            ,  @PS_CustomerFrom           varchar(10)
            ,  @PS_CustomerTo             varchar(10)
            ,  @PS_DeliveryPostcodeFrom   varchar(12)
            ,  @PS_DeliveryPostcodeTo     varchar(12)
            ,  @PS_CustomerSortKeyFrom    varchar(20)
            ,  @PS_CustomerSortKeyTo      varchar(20)
            ,  @PS_UserIDFrom             varchar(4)
            ,  @PS_UserIDTo               varchar(4)
            ,  @PS_UserKey1From           varchar(20)
            ,  @PS_UserKey1To             varchar(20)
            ,  @PS_UserKey2From           varchar(20)
            ,  @PS_UserKey2To             varchar(20)
            ,  @PS_UserKey3From           varchar(20)
            ,  @PS_UserKey3To             varchar(20)
            ,  @PS_UserID                 varchar(4)
            ,  @LS_Locked                 int         out
         '
      ,  @PS_OrderStatus            = @PS_OrderStatus
      ,  @PS_RequiredByDateFrom     = @PS_RequiredByDateFrom
      ,  @PS_RequiredByDateTo       = @PS_RequiredByDateTo
      ,  @PS_OrderDateFrom          = @PS_OrderDateFrom
      ,  @PS_OrderDateTo            = @PS_OrderDateTo
      ,  @PS_PeriodFrom             = @PS_PeriodFrom
      ,  @PS_PeriodTo               = @PS_PeriodTo
      ,  @PS_Year                   = @PS_Year
      ,  @PS_OrderNumberFrom        = @PS_OrderNumberFrom
      ,  @PS_OrderNumberTo          = @PS_OrderNumberTo
      ,  @PS_BatchRefFrom           = @PS_BatchRefFrom
      ,  @PS_BatchRefTo             = @PS_BatchRefTo
      ,  @PS_StockCodeFrom          = @PS_StockCodeFrom
      ,  @PS_StockCodeTo            = @PS_StockCodeTo
      ,  @PS_Site    = @PS_Site
      ,  @PS_CustomerFrom           = @PS_CustomerFrom
      ,  @PS_CustomerTo             = @PS_CustomerTo
      ,  @PS_DeliveryPostcodeFrom   = @PS_DeliveryPostcodeFrom
      ,  @PS_DeliveryPostcodeTo     = @PS_DeliveryPostcodeTo
      ,  @PS_CustomerSortKeyFrom    = @PS_CustomerSortKeyFrom
      ,  @PS_CustomerSortKeyTo      = @PS_CustomerSortKeyTo
      ,  @PS_UserIDFrom             = @PS_UserIDFrom
      ,  @PS_UserIDTo               = @PS_UserIDTo
      ,  @PS_UserKey1From           = @PS_UserKey1From
      ,  @PS_UserKey1To             = @PS_UserKey1To
      ,  @PS_UserKey2From           = @PS_UserKey2From
      ,  @PS_UserKey2To             = @PS_UserKey2To
      ,  @PS_UserKey3From           = @PS_UserKey3From
      ,  @PS_UserKey3To             = @PS_UserKey3To
      ,  @PS_UserID                 = @PS_UserID
      ,  @LS_Locked                 = @LS_Locked   out

      set @LS_Locked = isnull(@LS_Locked,-1)

      set @LS_SOP_WhereClause =  @LS_SOP_WhereClause + char(13)
                              +  ' and ((isnull(OH_MU_STATUS,'''')='''' and isnull(OH_MU_LOCK,0)=0) or OH_MU_USER=@PS_UserID)'

      if @PS_Lock > 0
         begin
            set @LS_SOP_SQLStatement   =  'update ORD_HEADER'
                                       +  ' set'
                                       +  ' OH_MU_USER=@PS_UserID'
                                       +  ',OH_MU_STATUS='+ case @PS_Lock
                                                               when 1 then '''A'''
                                                               else
                                                                  'null'
                                                            end
                                       +  ' where'
                                       +  ' OH_ORDER_NUMBER'
                                       +  ' in(select OH_ORDER_NUMBER from '+@LS_SOP_TableNames+' where '+@LS_SOP_WhereClause+@PS_ExtraSearchClause+')'

            execute sp_executesql
               @LS_SOP_SQLStatement
            ,  N'    @PS_OrderStatus            varchar(20)
                  ,  @PS_RequiredByDateFrom     datetime
                  ,  @PS_RequiredByDateTo       datetime
                  ,  @PS_OrderDateFrom          datetime
                  ,  @PS_OrderDateTo            datetime
                  ,  @PS_PeriodFrom             tinyint
                  ,  @PS_PeriodTo               tinyint
                  ,  @PS_Year                   varchar(1)
                  ,  @PS_OrderNumberFrom        int
                  ,  @PS_OrderNumberTo          int
                  ,  @PS_BatchRefFrom           varchar(10)
                  ,  @PS_BatchRefTo             varchar(10)
                  ,  @PS_StockCodeFrom          varchar(25)
                  ,  @PS_StockCodeTo            varchar(25)
                  ,  @PS_Site    varchar(25)
                  ,  @PS_CustomerFrom           varchar(10)
                  ,  @PS_CustomerTo             varchar(10)
                  ,  @PS_DeliveryPostcodeFrom   varchar(12)
                  ,  @PS_DeliveryPostcodeTo     varchar(12)
                  ,  @PS_CustomerSortKeyFrom    varchar(20)
                  ,  @PS_CustomerSortKeyTo      varchar(20)
                  ,  @PS_UserIDFrom             varchar(4)
                  ,  @PS_UserIDTo               varchar(4)
                  ,  @PS_UserKey1From           varchar(20)
                  ,  @PS_UserKey1To             varchar(20)
                  ,  @PS_UserKey2From           varchar(20)
                  ,  @PS_UserKey2To             varchar(20)
                  ,  @PS_UserKey3From           varchar(20)
                  ,  @PS_UserKey3To             varchar(20)
                  ,  @PS_UserID                 varchar(4)
               '
            ,  @PS_OrderStatus            = @PS_OrderStatus
            ,  @PS_RequiredByDateFrom     = @PS_RequiredByDateFrom
            ,  @PS_RequiredByDateTo       = @PS_RequiredByDateTo
            ,  @PS_OrderDateFrom          = @PS_OrderDateFrom
            ,  @PS_OrderDateTo            = @PS_OrderDateTo
            ,  @PS_PeriodFrom             = @PS_PeriodFrom
            ,  @PS_PeriodTo               = @PS_PeriodTo
            ,  @PS_Year                   = @PS_Year
            ,  @PS_OrderNumberFrom        = @PS_OrderNumberFrom
            ,  @PS_OrderNumberTo          = @PS_OrderNumberTo
            ,  @PS_BatchRefFrom           = @PS_BatchRefFrom
            ,  @PS_BatchRefTo             = @PS_BatchRefTo
            ,  @PS_StockCodeFrom          = @PS_StockCodeFrom
            ,  @PS_StockCodeTo            = @PS_StockCodeTo
            ,  @PS_Site    = @PS_Site
            ,  @PS_CustomerFrom           = @PS_CustomerFrom
            ,  @PS_CustomerTo             = @PS_CustomerTo
            ,  @PS_DeliveryPostcodeFrom   = @PS_DeliveryPostcodeFrom
            ,  @PS_DeliveryPostcodeTo     = @PS_DeliveryPostcodeTo
            ,  @PS_CustomerSortKeyFrom    = @PS_CustomerSortKeyFrom
            ,  @PS_CustomerSortKeyTo      = @PS_CustomerSortKeyTo
            ,  @PS_UserIDFrom             = @PS_UserIDFrom
            ,  @PS_UserIDTo               = @PS_UserIDTo
            ,  @PS_UserKey1From           = @PS_UserKey1From
            ,  @PS_UserKey1To             = @PS_UserKey1To
            ,  @PS_UserKey2From           = @PS_UserKey2From
            ,  @PS_UserKey2To             = @PS_UserKey2To
            ,  @PS_UserKey3From           = @PS_UserKey3From
            ,  @PS_UserKey3To             = @PS_UserKey3To
            ,  @PS_UserID                 = @PS_UserID

            update SYS_USER
               set
                  USER_SRV_ACTION = 'SK_A'
               where
                  USER_ID = @PS_UserID
         end   -- END if @PS_Lock > 0

      set @LS_SOP_SQLStatement   =  'select ' + char(13)
                                 +  @LS_SOP_Fields + char(13)
                                 +  ','+convert(varchar,@LS_Locked)+' as ''Number of orders already locked''' + char(13)
                                 +  ' from ' + char(13)
                                 +  @LS_SOP_TableNames + char(13)
                                 +  ' where ' + char(13)
                                 +  @LS_SOP_WhereClause + char(13) 
                                 +  @PS_ExtraSearchClause + char(13)
   end
   
if @PS_Include_WorksOrders = 1
   begin
      select
         @LS_WO_IncludeExtraWhereClause = 0
      ,  @LS_WO_ExtraWhereClause        = ''  --this is used only if searching on fields in SL_ACCOUNTS table, as joins to ORD_DETAIL and SL_ACCOUNTS are then needed
      ,  @LS_WO_PrimaryFieldName       = 'STKCODE'

      -- Fields must always contain all the order by fields and
      -- the specified primary as well as the list fields
      --                         select
      ,  @LS_WO_Fields        = ' ''W'''
                              + ',WC_ORDER_NUMBER'
                              + ',WC_PRIMARY'
                              + ','''''
                              + ',STKCODE as stockcode'
                              + ',WC_QUANTITY_REQUIRED-WC_QUANTITY_ISSUED as ''quantity outstanding'''
                              + ',WO_END_DATE'
                              + ',WC_QUANTITY_REQUIRED'
                              + ',WC_QUANTITY_ISSUED'
                              + ',0'
                              + ','''''
                              + ',0'
                              + ',WO_PRIORITY'
                              + ',0'
                              + ',STKNAME'

      if @LS_WMSS_SITE_ANALYSIS <> ''
         set @LS_WO_Fields   = @LS_WO_Fields + char(13)
            + ',case STK_MULTILOCATN when 1 then isnull(SitePhsQty,0)
                   else STK_PHYSICAL + STK_QTYPRINTED 
                end as physical
               ,case STK_MULTILOCATN 
                  when 1 then isnull(ssr.AllocationQuantity,0) + isnull(swsr.AllocationQuantity,0)
                  else isnull(sr.AllocationQuantity,0) + isnull(swr.AllocationQuantity,0) 
                end'
      else
         set @LS_WO_Fields   = @LS_WO_Fields + char(13)
            + ',STK_PHYSICAL + STK_QTYPRINTED
               ,isnull(sr.AllocationQuantity,0) + isnull(swr.AllocationQuantity,0)'

      set @LS_WO_Fields       = @LS_WO_Fields + char(13)
                              + ',STK_BIN_NUMBER'
                              + ',WO_PRIORITY'
                              + ','''''
                              + ',isnull(WMWR_QUANTITY,0)
                                 ,0
                                 ,0
                                 ,coalesce(WMSPD_SITE,SopSite,WMSS_DEFAULT_SITE,'''') as Site
                                 ,STK_MULTILOCATN
                                 ,0
                                 ,WMSPD_HOLD_REF as OrderHoldRef
                                 ,isnull(HoldQty,0) as HoldQty
                                 ,isnull(case when AllocHoldQty > HoldQty then HoldQty else AllocHoldQty end, 0) as AllocHoldQty
                                 ,isnull(HoldRefQty,0) as HoldRefQty
                                 ,isnull(AllocHoldRefQty, 0) + isnull(WoAllocHoldRefQty, 0) as AllocHoldRefQty
                                 ,0
                                 ,0'
      --                           from
      set @LS_WO_TableNames   = ' WO_COMPONENTS'
                              + ' inner join WO_ORDERS on WO_ORDER_NUMBER=WC_ORDER_NUMBER'
                              + ' inner join WO_ROUTES on WR_PRIMARY=WO_ROUTE_LINK'
                              + ' inner join SYS_DATAINFO on SYS_PRIMARY = 1'
                              + ' inner join SDK_WMS_SETTINGS on WMSS_PRIMARY = 1'
                              + ' inner join STK_STOCK on STK_PRIMARY=WC_PART_LINK and dbo.AA_SYS_CHECK_RECORD_LEVELS_F(9,''T'',STK_LEVEL,@PS_UserID)=1'
                              + ' left join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP'''
                              + ' left join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY'
                              + ' left join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY'
                              + ' left join SDK_WMS_STOCK_RESERVATION_VIEW sr on sr.StockLink = STK_PRIMARY'
                              + ' left join SDK_WMS_STOCK_WO_RESERVATION_VIEW swr on swr.StockLink = STK_PRIMARY'
                              + ' left join ('
                              + '   select
                                       case when count(distinct WMSPD_SITE) = 1 then max(WMSPD_SITE) end SopSite
                                       , OD_WO_NUMBER
                                       from ORD_DETAIL
                                       join ORD_HEADER on OH_ORDER_NUMBER = OD_ORDER_NUMBER
                                       join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                                       join SDK_WMS_SEND_STATUS_DETAIL on OD_PRIMARY=WMSPD_TRAN_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY
                                       group by OD_WO_NUMBER
                                ) SopSites on OD_WO_NUMBER = WO_TOP_LEVEL_ORDER_NUMBER'
      if @LS_WMSS_SITE_ANALYSIS <> ''
         set @LS_WO_TableNames = @LS_WO_TableNames + char(13)
            + ' left join SDK_WMS_STOCK_SITE_RESERVATION_VIEW ssr on ssr.StockLink = STK_PRIMARY and ssr.Site = coalesce(WMSPD_SITE,SopSite,WMSS_DEFAULT_SITE,'''')'
            + ' left join SDK_WMS_STOCK_WO_SITE_RESERVATION_VIEW swsr on swsr.StockLink = STK_PRIMARY and swsr.Site = coalesce(WMSPD_SITE,SopSite,WMSS_DEFAULT_SITE,'''')'

      if @LS_WMSS_SITE_ANALYSIS <> ''
         begin
            set @LS_WO_TableNames = @LS_WO_TableNames + char(13)
            + ' left join (select isnull(sum(LOC_PHYSICAL + LOC_QTYPRINTED),0) SitePhsQty, LOC_STOCK_CODE stk, ' + @LS_WMSS_SITE_ANALYSIS + ' StkSite from STK_LOCATION 
                              group by LOC_STOCK_CODE, ' + @LS_WMSS_SITE_ANALYSIS + ' ) StkSiteQtys on StkSiteQtys.stk = STKCODE and StkSiteQtys.StkSite = coalesce(WMSPD_SITE,SopSite,WMSS_DEFAULT_SITE,'''')
                left join
                ( select isnull(
                                sum(case 
                                       when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then HoldQty 
                                       else isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0)
                                    end
                               ),0) as AllocHoldQty
                      , sum(HoldQty) as HoldQty
                      , HoldStkCode
                      , isnull(HoldSite,'''') as HoldSite
                  from          
                   ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) as HoldQty
                     ,OD_STOCK_CODE as HoldStkCode
                     ,' + @LS_WMSS_SITE_ANALYSIS + ' as HoldSite
                     ,OD_USRCHAR3 as HoldRef
                     ,case when min(OD_LOCATN) <> '''' then 1 else 0 end HasSubAnalysis
                     from ORD_HEADER 
                        join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                        join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                        left join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                     where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                     group by OD_STOCK_CODE, ' + @LS_WMSS_SITE_ANALYSIS + ',OD_USRCHAR3
                   ) HoldStock

                   left join
                  ( select sum(WMR_QUANTITY) AllocHoldQty
                        , OD_STOCK_CODE      AllocHoldStkCode
                        , WMSPD_SITE         AllocHoldSite
                        , WMSPD_HOLD_REF     AllocHoldRef
                        from ORD_HEADER 
                           inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                           join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                        where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                        group by OD_STOCK_CODE,WMSPD_SITE,WMSPD_HOLD_REF
                  ) AllocHoldStock
                     on AllocHoldStkCode = HoldStkCode and (AllocHoldSite = HoldSite or HasSubAnalysis = 0) and AllocHoldRef = HoldRef

                   left join
                  ( select sum(WMWR_QUANTITY) WoAllocHoldQty
                        , STKCODE             WoAllocHoldStkCode
                        , WMSPD_SITE          WoAllocHoldSite
                        , WMSPD_HOLD_REF      WoAllocHoldRef
                        from WO_ORDERS
                           inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                           inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                           join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                        where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                        group by STKCODE,WMSPD_SITE,WMSPD_HOLD_REF
                  ) WoAllocHoldStock
                     on WoAllocHoldStkCode = HoldStkCode and (WoAllocHoldSite = HoldSite or HasSubAnalysis = 0) and WoAllocHoldRef = HoldRef

                 group by HoldStkCode, HoldSite
               ) as HeldStk on HoldStkCode = STKCODE and (HoldSite = coalesce(WMSPD_SITE,SopSite,WMSS_DEFAULT_SITE,'''') or HoldSite = '''')

                left join
               ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) HoldRefQty
                  ,OD_STOCK_CODE HoldRefStkCode
                  ,' + @LS_WMSS_SITE_ANALYSIS + ' HoldRefSite
                  ,OD_USRCHAR3 HoldRef
                  from ORD_HEADER 
                     join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                     join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                     left join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                  where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                  group by OD_STOCK_CODE, OD_USRCHAR3, ' + @LS_WMSS_SITE_ANALYSIS + '
               ) HoldRefStock 
                     on HoldRefStkCode = STKCODE and (HoldRefSite = WMSPD_SITE or HoldRefSite is null)
                        and HoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMR_QUANTITY) AllocHoldRefQty
                     , OD_STOCK_CODE      AllocHoldRefStkCode
                     , WMSPD_SITE         AllocHoldRefSite
                     , WMSPD_HOLD_REF     AllocHoldRef
                     from ORD_HEADER 
                        inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                        join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                     where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                     group by OD_STOCK_CODE,WMSPD_SITE,WMSPD_HOLD_REF
               ) AllocHoldRefStock
                  on AllocHoldRefStkCode = STKCODE and (AllocHoldRefSite = WMSPD_SITE or STK_MULTILOCATN = 0)
                     and AllocHoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMWR_QUANTITY) WoAllocHoldRefQty
                     , STKCODE             WoAllocHoldRefStkCode
                     , WMSPD_SITE          WoAllocHoldRefSite
                     , WMSPD_HOLD_REF      WoAllocHoldRef
                     from WO_ORDERS
                        inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                        inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                        join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                     where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                     group by STKCODE,WMSPD_SITE,WMSPD_HOLD_REF
               ) WoAllocHoldStock
                  on WoAllocHoldRefStkCode = STKCODE and (WoAllocHoldRefSite = WMSPD_SITE or STK_MULTILOCATN = 0)
                     and WoAllocHoldRef = WMSPD_HOLD_REF
            '
         end
      else
         begin
            set @LS_WO_TableNames = @LS_WO_TableNames
            + ' left join
                ( select isnull(
                                sum(case 
                                       when isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0) >= HoldQty then HoldQty 
                                       else isnull(AllocHoldQty,0) + isnull(WoAllocHoldQty,0)
                                    end
                               ),0) as AllocHoldQty
                      , sum(HoldQty) as HoldQty
                      , HoldStkCode
                  from          
                   ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) as HoldQty
                     ,OD_STOCK_CODE as HoldStkCode
                     ,OD_USRCHAR3 as HoldRef
                     from ORD_HEADER 
                        join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                        join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                     where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                     group by OD_STOCK_CODE, OD_USRCHAR3
                   ) HoldStock 
                   left join
                  ( select sum(WMR_QUANTITY) AllocHoldQty
                        , OD_STOCK_CODE      AllocHoldStkCode
                        , WMSPD_HOLD_REF     AllocHoldRef
                        from ORD_HEADER 
                           inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                           join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                        where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                        group by OD_STOCK_CODE, WMSPD_HOLD_REF
                  ) AllocHoldStock
                     on AllocHoldStkCode = HoldStkCode and AllocHoldRef = HoldRef
                   left join
                  ( select sum(WMWR_QUANTITY) WoAllocHoldQty
                        , STKCODE             WoAllocHoldStkCode
                        , WMSPD_HOLD_REF      WoAllocHoldRef
                        from WO_ORDERS
                           inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                           inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                           join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                           join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                           join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                        where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                        group by STKCODE,WMSPD_HOLD_REF
                  ) WoAllocHoldStock
                     on WoAllocHoldStkCode = HoldStkCode and WoAllocHoldRef = HoldRef
                 group by HoldStkCode
               ) as HeldStk on HoldStkCode = STKCODE

                left join
               ( select isnull(sum(dbo.AA_QUANTITY_DPS_F(OD_QTYORD*OD_QTYUNIT)),0) HoldRefQty
                  ,OD_STOCK_CODE HoldRefStkCode
                  ,OD_USRCHAR3 HoldRef
                  from ORD_HEADER 
                     join ORD_DETAIL on OD_ORDER_NUMBER = OH_ORDER_NUMBER
                     join ORD_DETAIL2 on OD_PRIMARY_2 = OD_PRIMARY
                     left join STK_LOCATION on LOC_STOCK_CODE = OD_STOCK_CODE and LOC_CODE = OD_LOCATN
                  where OH_BATCH_FLAG = 1 and OH_BATCH_REF = ''ONHOLD-ZZ'' and OH_TYPE = ''O''
                  group by OD_STOCK_CODE, OD_USRCHAR3
               ) HoldRefStock 
                     on HoldRefStkCode = STKCODE
                        and HoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMR_QUANTITY) AllocHoldRefQty
                     , OD_STOCK_CODE      AllocHoldRefStkCode
                     , WMSPD_HOLD_REF     AllocHoldRef
                     from ORD_HEADER 
                        inner join ORD_DETAIL on OD_ORDER_NUMBER=OH_ORDER_NUMBER 
                        join SDK_WMS_SEND_STATUS on OH_PRIMARY=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''SOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=OD_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_RESERVATION on WMR_ORDER_DETAIL_LINK = OD_PRIMARY
                     where OD_TYPE=''O'' and OD_ENTRY_TYPE=''S'' and OD_QTYDELVD<OD_QTYORD and OH_BATCH_FLAG=1 and OH_PRIORITY<3 and WMSPD_HOLD_REF<>''''
                     group by OD_STOCK_CODE,WMSPD_HOLD_REF
               ) AllocHoldRefStock
                  on AllocHoldRefStkCode = STKCODE
                     and AllocHoldRef = WMSPD_HOLD_REF
                left join
               ( select sum(WMWR_QUANTITY) WoAllocHoldRefQty
                     , STKCODE             WoAllocHoldRefStkCode
                     , WMSPD_HOLD_REF      WoAllocHoldRef
                     from WO_ORDERS
                        inner join WO_COMPONENTS on WC_ORDER_NUMBER=WO_ORDER_NUMBER and WC_TYPE=''S''
                        inner join STK_STOCK on STK_PRIMARY = WC_PART_LINK
                        join SDK_WMS_SEND_STATUS on WC_ORDER_NUMBER=WMSP_TRAN_PRIMARY and WMSP_TRAN_TYPE=''WOP''
                        join SDK_WMS_SEND_STATUS_DETAIL on WMSPD_TRAN_PRIMARY=WC_PRIMARY and WMSPD_WMSP_PRIMARY=WMSP_PRIMARY 
                        join SDK_WMS_STOCK_WO_RESERVATION on WMWR_COMPONENT_LINK = WC_PRIMARY
                     where WC_QUANTITY_ISSUED < WC_QUANTITY_REQUIRED and WO_STATUS<10 and WMSPD_HOLD_REF<>''''
                     group by STKCODE,WMSPD_HOLD_REF
               ) WoAllocHoldStock
                  on WoAllocHoldRefStkCode = STKCODE
                     and WoAllocHoldRef = WMSPD_HOLD_REF
            '
         end

      --                            where
      set @LS_WO_WhereClause  = ' WC_TYPE=''S'' and WC_QUANTITY_ISSUED<WC_QUANTITY_REQUIRED and WO_STATUS not in (10,14,15)'    --do not include completed,merged or cancelled works orders

      select
         @PS_FinishDateFrom   = nullif(@PS_FinishDateFrom,'')
      ,  @PS_FinishDateTo     = nullif(@PS_FinishDateTo,'')

      if @PS_FinishDateSearch <> 7 and (@PS_FinishDateFrom is not null or @PS_FinishDateTo is not null)
         begin
            if @PS_FinishDateSearch = 0 and @PS_FinishDateFrom is null
               set @PS_FinishDateSearch = 5

            if @PS_FinishDateSearch = 0 and @PS_FinishDateTo is null
               set @PS_FinishDateSearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_FinishDateSearch
                     when 0 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(WO_END_DATE) between @PS_FinishDateFrom and @PS_FinishDateTo'
                     when 2 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(WO_END_DATE) = @PS_FinishDateFrom'
                     when 3 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(WO_END_DATE) <> @PS_FinishDateFrom'
                     when 4 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(WO_END_DATE) >= @PS_FinishDateFrom'
                     when 5 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(WO_END_DATE) <= @PS_FinishDateTo'
                     when 6 then ' and dbo.AA_STRIP_TIME_FROM_DATE_F(WO_END_DATE) not between @PS_FinishDateFrom and @PS_FinishDateTo'
                     when 7 then ' and WO_END_DATE is null'
                     else
                        ''
                  end
         end

      select
         @PS_TopLevelWONumberFrom   = nullif(@PS_TopLevelWONumberFrom,'')
      ,  @PS_TopLevelWONumberTo     = nullif(@PS_TopLevelWONumberTo,'')

      if @PS_TopLevelWONumberSearch <> 7 and (@PS_TopLevelWONumberFrom is not null or @PS_TopLevelWONumberTo is not null)
         begin
            if @PS_TopLevelWONumberSearch = 0 and @PS_TopLevelWONumberFrom is null
               set @PS_TopLevelWONumberSearch = 5

            if @PS_TopLevelWONumberSearch = 0 and @PS_TopLevelWONumberTo is null
               set @PS_TopLevelWONumberSearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_TopLevelWONumberSearch
                     when 0 then ' and WC_TOP_LEVEL_ORDER_NUMBER between @PS_TopLevelWONumberFrom and @PS_TopLevelWONumberTo'
                     when 1 then ' and convert(varchar,WC_TOP_LEVEL_ORDER_NUMBER) like convert(varchar,@PS_TopLevelWONumberFrom) + ''%'''
                     when 2 then ' and WC_TOP_LEVEL_ORDER_NUMBER = @PS_TopLevelWONumberFrom'
                     when 3 then ' and WC_TOP_LEVEL_ORDER_NUMBER <> @PS_TopLevelWONumberFrom'
                     when 4 then ' and WC_TOP_LEVEL_ORDER_NUMBER >= @PS_TopLevelWONumberFrom'
                     when 5 then ' and WC_TOP_LEVEL_ORDER_NUMBER <= @PS_TopLevelWONumberTo'
                     when 6 then ' and WC_TOP_LEVEL_ORDER_NUMBER not between @PS_TopLevelWONumberFrom and @PS_TopLevelWONumberTo'
                     when 7 then ' and WC_TOP_LEVEL_ORDER_NUMBER is null'
                     else
                        ''
                  end
         end

      select
         @PS_WorksOrderNumberFrom   = nullif(@PS_WorksOrderNumberFrom,'')
      ,  @PS_WorksOrderNumberTo     = nullif(@PS_WorksOrderNumberTo,'')

      if @PS_WorksOrderNumberSearch <> 7 and (@PS_WorksOrderNumberFrom is not null or @PS_WorksOrderNumberTo is not null)
         begin
            if @PS_WorksOrderNumberSearch = 0 and @PS_WorksOrderNumberFrom is null
               set @PS_WorksOrderNumberSearch = 5

            if @PS_WorksOrderNumberSearch = 0 and @PS_WorksOrderNumberTo is null
               set @PS_WorksOrderNumberSearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_WorksOrderNumberSearch
                     when 0 then ' and WC_ORDER_NUMBER between @PS_WorksOrderNumberFrom and @PS_WorksOrderNumberTo'
                     when 1 then ' and convert(varchar,WC_ORDER_NUMBER) like convert(varchar,@PS_WorksOrderNumberFrom) + ''%'''
                     when 2 then ' and WC_ORDER_NUMBER = @PS_WorksOrderNumberFrom'
                     when 3 then ' and WC_ORDER_NUMBER <> @PS_WorksOrderNumberFrom'
                     when 4 then ' and WC_ORDER_NUMBER >= @PS_WorksOrderNumberFrom'
                     when 5 then ' and WC_ORDER_NUMBER <= @PS_WorksOrderNumberTo'
                     when 6 then ' and WC_ORDER_NUMBER not between @PS_WorksOrderNumberFrom and @PS_WorksOrderNumberTo'
                     when 7 then ' and WC_ORDER_NUMBER is null'
                     else
                        ''
                  end
         end

      select
         @PS_AssemblyStockCodeFrom  = nullif(@PS_AssemblyStockCodeFrom,'')
      ,  @PS_AssemblyStockCodeTo    = nullif(@PS_AssemblyStockCodeTo,'')

      if @PS_AssemblyStockCodeSearch <> 7 and (@PS_AssemblyStockCodeFrom is not null or @PS_AssemblyStockCodeTo is not null)
         begin
            if @PS_AssemblyStockCodeSearch = 0 and @PS_AssemblyStockCodeFrom is null
               set @PS_AssemblyStockCodeSearch = 5

            if @PS_AssemblyStockCodeSearch = 0 and @PS_AssemblyStockCodeTo is null
               set @PS_AssemblyStockCodeSearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +'  and exists(select 1 from STK_STOCK where STK_PRIMARY=WO_STOCK_LINK'
                  +
                  case @PS_AssemblyStockCodeSearch
                     when 0 then ' and STKCODE between @PS_AssemblyStockCodeFrom and @PS_AssemblyStockCodeTo'
                     when 1 then ' and convert(varchar,STKCODE) like convert(varchar,@PS_AssemblyStockCodeFrom) + ''%'''
                     when 2 then ' and STKCODE = @PS_AssemblyStockCodeFrom'
                     when 3 then ' and STKCODE <> @PS_AssemblyStockCodeFrom'
                     when 4 then ' and STKCODE >= @PS_AssemblyStockCodeFrom'
                     when 5 then ' and STKCODE <= @PS_AssemblyStockCodeTo'
                     when 6 then ' and STKCODE not between @PS_AssemblyStockCodeFrom and @PS_AssemblyStockCodeTo'
                     when 7 then ' and isnull(STKCODE,'''') = '''''
                     else
                        ''
                  end
                  +' )'
         end

      select
         @PS_ComponentStockCodeFrom = nullif(@PS_ComponentStockCodeFrom,'')
      ,  @PS_ComponentStockCodeTo   = nullif(@PS_ComponentStockCodeTo,'')

      if @PS_ComponentStockCodeSearch <> 7 and (@PS_ComponentStockCodeFrom is not null or @PS_ComponentStockCodeTo is not null)
         begin
            if @PS_ComponentStockCodeSearch = 0 and @PS_ComponentStockCodeFrom is null
               set @PS_ComponentStockCodeSearch = 5

            if @PS_ComponentStockCodeSearch = 0 and @PS_ComponentStockCodeTo is null
               set @PS_ComponentStockCodeSearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_ComponentStockCodeSearch
                     when 0 then ' and STKCODE between @PS_ComponentStockCodeFrom and @PS_ComponentStockCodeTo'
                     when 1 then ' and convert(varchar,STKCODE) like convert(varchar,@PS_ComponentStockCodeFrom) + ''%'''
                     when 2 then ' and STKCODE = @PS_ComponentStockCodeFrom'
                     when 3 then ' and STKCODE <> @PS_ComponentStockCodeFrom'
                     when 4 then ' and STKCODE >= @PS_ComponentStockCodeFrom'
                     when 5 then ' and STKCODE <= @PS_ComponentStockCodeTo'
                     when 6 then ' and STKCODE not between @PS_ComponentStockCodeFrom and @PS_ComponentStockCodeTo'
                     when 7 then ' and isnull(STKCODE,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_RouteCodeFrom = nullif(@PS_RouteCodeFrom,'')
      ,  @PS_RouteCodeTo   = nullif(@PS_RouteCodeTo,'')

      if @PS_RouteCodeSearch <> 7 and (@PS_RouteCodeFrom is not null or @PS_RouteCodeTo is not null)
         begin
            if @PS_RouteCodeSearch = 0 and @PS_RouteCodeFrom is null
               set @PS_RouteCodeSearch = 5

            if @PS_RouteCodeSearch = 0 and @PS_RouteCodeTo is null
               set @PS_RouteCodeSearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_RouteCodeSearch
                     when 0 then ' and WR_ROUTE between @PS_RouteCodeFrom and @PS_RouteCodeTo'
                     when 1 then ' and convert(varchar,WR_ROUTE) like convert(varchar,@PS_RouteCodeFrom) + ''%'''
                     when 2 then ' and WR_ROUTE = @PS_RouteCodeFrom'
                     when 3 then ' and WR_ROUTE <> @PS_RouteCodeFrom'
                     when 4 then ' and WR_ROUTE >= @PS_RouteCodeFrom'
                     when 5 then ' and WR_ROUTE <= @PS_RouteCodeTo'
                     when 6 then ' and WR_ROUTE not between @PS_RouteCodeFrom and @PS_RouteCodeTo'
                     when 7 then ' and isnull(WR_ROUTE,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_WOSortKeyFrom = nullif(@PS_WOSortKeyFrom,'')
      ,  @PS_WOSortKeyTo   = nullif(@PS_WOSortKeyTo,'')

      if @PS_WOSortKeySearch <> 7 and (@PS_WOSortKeyFrom is not null or @PS_WOSortKeyTo is not null)
         begin
            if @PS_WOSortKeySearch = 0 and @PS_WOSortKeyFrom is null
               set @PS_WOSortKeySearch = 5

            if @PS_WOSortKeySearch = 0 and @PS_WOSortKeyTo is null
               set @PS_WOSortKeySearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_WOSortKeySearch
                     when 0 then ' and WO_SORT_KEY between @PS_WOSortKeyFrom and @PS_WOSortKeyTo'
                     when 1 then ' and WO_SORT_KEY like @PS_WOSortKeyFrom + ''%'''
                     when 2 then ' and WO_SORT_KEY = @PS_WOSortKeyFrom'
                     when 3 then ' and WO_SORT_KEY <> @PS_WOSortKeyFrom'
                     when 4 then ' and WO_SORT_KEY >= @PS_WOSortKeyFrom'
                     when 5 then ' and WO_SORT_KEY <= @PS_WOSortKeyTo'
                     when 6 then ' and WO_SORT_KEY not between @PS_WOSortKeyFrom and @PS_WOSortKeyTo'
                     when 7 then ' and isnull(WO_SORT_KEY,'''') = '''''
                     else
                        ''
                  end
         end

      select
         @PS_WOPriorityFrom   = nullif(@PS_WOPriorityFrom,'')
      ,  @PS_WOPriorityTo     = nullif(@PS_WOPriorityTo,'')

      if @PS_WOPrioritySearch <> 7 and (@PS_WOPriorityFrom is not null or @PS_WOPriorityTo is not null)
         begin
            if @PS_WOPrioritySearch = 0 and @PS_WOPriorityFrom is null
               set @PS_WOPrioritySearch = 5

            if @PS_WOPrioritySearch = 0 and @PS_WOPriorityTo is null
               set @PS_WOPrioritySearch = 4

            set   @LS_WO_WhereClause = @LS_WO_WhereClause
                  +
                  case @PS_WOPrioritySearch
                     when 0 then ' and WO_PRIORITY between @PS_WOPriorityFrom and @PS_WOPriorityTo'
                     when 2 then ' and WO_PRIORITY = @PS_WOPriorityFrom'
                     when 3 then ' and WO_PRIORITY <> @PS_WOPriorityFrom'
                     when 4 then ' and WO_PRIORITY >= @PS_WOPriorityFrom'
                     when 5 then ' and WO_PRIORITY <= @PS_WOPriorityTo'
                     when 6 then ' and WO_PRIORITY not between @PS_WOPriorityFrom and @PS_WOPriorityTo'
                     when 7 then ' and WO_PRIORITY is null'
                     else
                        ''
                  end
         end

      select
         @PS_WO_CustomerCodeFrom = nullif(@PS_WO_CustomerCodeFrom,'')
      ,  @PS_WO_CustomerCodeTo   = nullif(@PS_WO_CustomerCodeTo,'')

      if @PS_WO_CustomerCodeSearch <> 7 and (@PS_WO_CustomerCodeFrom is not null or @PS_WO_CustomerCodeTo is not null)
         begin
            if @PS_WO_CustomerCodeSearch = 0 and @PS_WO_CustomerCodeFrom is null
               set @PS_WO_CustomerCodeSearch = 5

            if @PS_WO_CustomerCodeSearch = 0 and @PS_WO_CustomerCodeTo is null
               set @PS_WO_CustomerCodeSearch = 4

            set @LS_WO_ExtraWhereClause = @LS_WO_ExtraWhereClause
                  +
                  case @PS_WO_CustomerCodeSearch
                     when 0 then ' and OH_ACCOUNT_ORDER between @PS_WO_CustomerCodeFrom and @PS_WO_CustomerCodeTo'
                     when 2 then ' and OH_ACCOUNT_ORDER = @PS_WO_CustomerCodeFrom'
                     when 3 then ' and OH_ACCOUNT_ORDER <> @PS_WO_CustomerCodeFrom'
                     when 4 then ' and OH_ACCOUNT_ORDER >= @PS_WO_CustomerCodeFrom'
                     when 5 then ' and OH_ACCOUNT_ORDER <= @PS_WO_CustomerCodeTo'
                     when 6 then ' and OH_ACCOUNT_ORDER not between @PS_WO_CustomerCodeFrom and @PS_WOCustomerCodeTo'
                     when 7 then ' and OH_ACCOUNT_ORDER is null'
                     else
                        ''
                  end
            set @LS_WO_IncludeExtraWhereClause = 1  --flag to say join on ORD_DETAIL and SL_ACCOUNTS
         end

      select
         @PS_WO_CustomerSortKeyFrom = nullif(@PS_WO_CustomerSortKeyFrom,'')
      ,  @PS_WO_CustomerSortKeyTo   = nullif(@PS_WO_CustomerSortKeyTo,'')

      if @PS_WO_CustomerSortKeySearch <> 7 and (@PS_WO_CustomerSortKeyFrom is not null or @PS_WO_CustomerSortKeyTo is not null)
         begin
            if @PS_WO_CustomerSortKeySearch = 0 and @PS_WO_CustomerSortKeyFrom is null
               set @PS_WO_CustomerSortKeySearch = 5

            if @PS_WO_CustomerSortKeySearch = 0 and @PS_WO_CustomerSortKeyTo is null
               set @PS_WO_CustomerSortKeySearch = 4

            set @LS_WO_ExtraWhereClause = @LS_WO_ExtraWhereClause
                  +
                  case @PS_WO_CustomerSortKeySearch
                     when 0 then ' and CUSORT between @PS_WO_CustomerSortKeyFrom and @PS_WO_CustomerSortKeyTo'
                     when 2 then ' and CUSORT = @PS_WO_CustomerSortKeyFrom'
                     when 3 then ' and CUSORT <> @PS_WO_CustomerSortKeyFrom'
                     when 4 then ' and CUSORT >= @PS_WO_CustomerSortKeyFrom'
                     when 5 then ' and CUSORT <= @PS_WO_CustomerSortKeyTo'
                     when 6 then ' and CUSORT not between @PS_WO_CustomerSortKeyFrom and @PS_WOCustomerSortKeyTo'
                     when 7 then ' and CUSORT is null'
                     else
                        ''
                  end
            set @LS_WO_IncludeExtraWhereClause = 1  --flag to say join on ORD_DETAIL and SL_ACCOUNTS
         end

      select
         @PS_WO_CustomerUserKey1From   = nullif(@PS_WO_CustomerUserKey1From,'')
      ,  @PS_WO_CustomerUserKey1To     = nullif(@PS_WO_CustomerUserKey1To,'')

      if @PS_WO_CustomerUserKey1Search <> 7 and (@PS_WO_CustomerUserKey1From is not null or @PS_WO_CustomerUserKey1To is not null)
         begin
            if @PS_WO_CustomerUserKey1Search = 0 and @PS_WO_CustomerUserKey1From is null
               set @PS_WO_CustomerUserKey1Search = 5

            if @PS_WO_CustomerUserKey1Search = 0 and @PS_WO_CustomerUserKey1To is null
               set @PS_WO_CustomerUserKey1Search = 4

            set @LS_WO_ExtraWhereClause = @LS_WO_ExtraWhereClause
                  +
                  case @PS_WO_CustomerUserKey1Search
                     when 0 then ' and CUUSER1 between @PS_WO_CustomerUserKey1From and @PS_WO_CustomerUserKey1To'
                     when 2 then ' and CUUSER1 = @PS_WO_CustomerUserKey1From'
                     when 3 then ' and CUUSER1 <> @PS_WO_CustomerUserKey1From'
                     when 4 then ' and CUUSER1 >= @PS_WO_CustomerUserKey1From'
                     when 5 then ' and CUUSER1 <= @PS_WO_CustomerUserKey1To'
                     when 6 then ' and CUUSER1 not between @PS_WO_CustomerUserKey1From and @PS_WOCustomerUserKey1To'
                     when 7 then ' and CUUSER1 is null'
                     else
                        ''
                  end
            set @LS_WO_IncludeExtraWhereClause = 1  --flag to say join on ORD_DETAIL and SL_ACCOUNTS
         end

      select
         @PS_WO_CustomerUserKey2From   = nullif(@PS_WO_CustomerUserKey2From,'')
      ,  @PS_WO_CustomerUserKey2To     = nullif(@PS_WO_CustomerUserKey2To,'')

      if @PS_WO_CustomerUserKey2Search <> 7 and (@PS_WO_CustomerUserKey2From is not null or @PS_WO_CustomerUserKey2To is not null)
         begin
            if @PS_WO_CustomerUserKey2Search = 0 and @PS_WO_CustomerUserKey2From is null
               set @PS_WO_CustomerUserKey2Search = 5

            if @PS_WO_CustomerUserKey2Search = 0 and @PS_WO_CustomerUserKey2To is null
               set @PS_WO_CustomerUserKey2Search = 4

            set @LS_WO_ExtraWhereClause = @LS_WO_ExtraWhereClause
                  +
                  case @PS_WO_CustomerUserKey2Search
                     when 0 then ' and CUUSER2 between @PS_WO_CustomerUserKey2From and @PS_WO_CustomerUserKey2To'
                     when 2 then ' and CUUSER2 = @PS_WO_CustomerUserKey2From'
                     when 3 then ' and CUUSER2 <> @PS_WO_CustomerUserKey2From'
                     when 4 then ' and CUUSER2 >= @PS_WO_CustomerUserKey2From'
                     when 5 then ' and CUUSER2 <= @PS_WO_CustomerUserKey2To'
                     when 6 then ' and CUUSER2 not between @PS_WO_CustomerUserKey2From and @PS_WOCustomerUserKey2To'
                     when 7 then ' and CUUSER2 is null'
                     else
                        ''
                  end
            set @LS_WO_IncludeExtraWhereClause = 1  --flag to say join on ORD_DETAIL and SL_ACCOUNTS
         end

      select
         @PS_WO_CustomerUserKey3From   = nullif(@PS_WO_CustomerUserKey3From,'')
      ,  @PS_WO_CustomerUserKey3To     = nullif(@PS_WO_CustomerUserKey3To,'')

      if @PS_WO_CustomerUserKey3Search <> 7 and (@PS_WO_CustomerUserKey3From is not null or @PS_WO_CustomerUserKey3To is not null)
         begin
            if @PS_WO_CustomerUserKey3Search = 0 and @PS_WO_CustomerUserKey3From is null
               set @PS_WO_CustomerUserKey3Search = 5

            if @PS_WO_CustomerUserKey3Search = 0 and @PS_WO_CustomerUserKey3To is null
               set @PS_WO_CustomerUserKey3Search = 4

            set @LS_WO_ExtraWhereClause = @LS_WO_ExtraWhereClause
                  +
                  case @PS_WO_CustomerUserKey3Search
                     when 0 then ' and CUUSER3 between @PS_WO_CustomerUserKey3From and @PS_WO_CustomerUserKey3To'
                     when 2 then ' and CUUSER3 = @PS_WO_CustomerUserKey3From'
                     when 3 then ' and CUUSER3 <> @PS_WO_CustomerUserKey3From'
                     when 4 then ' and CUUSER3 >= @PS_WO_CustomerUserKey3From'
                     when 5 then ' and CUUSER3 <= @PS_WO_CustomerUserKey3To'
                     when 6 then ' and CUUSER3 not between @PS_WO_CustomerUserKey3From and @PS_WOCustomerUserKey3To'
                     when 7 then ' and CUUSER3 is null'
                     else
                        ''
                  end
            set @LS_WO_IncludeExtraWhereClause = 1  --flag to say join on ORD_DETAIL and SL_ACCOUNTS
         end

      select @PS_ComponentSite = nullif(@PS_ComponentSite,'')

      if @PS_ComponentSite is not null
         begin
            set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13) + ' and coalesce(WMSPD_SITE,SopSite,WMSS_DEFAULT_SITE,'''') = @PS_ComponentSite'
         end

      if @PS_IncludeFullyAllocatedLines = 0 or @PS_IncludeFullyAllocatedLines is null
         set @LS_WO_WhereClause = @LS_WO_WhereClause + ' and (WC_QUANTITY_REQUIRED-WC_QUANTITY_ISSUED) - isnull(WMWR_QUANTITY,0) >=  (0.5/power(10,QUANTITY_DPS))'

      if @PS_OnlyShowLinesWithAvailableStock = 1 and @LS_WMSS_SITE_ANALYSIS <> ''
      begin
         set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13)
         + ' and 
               ((
                (case STK_MULTILOCATN 
                     when 1 then isnull(SitePhsQty,0) - isnull(ssr.AllocationQuantity,0) - isnull(swsr.AllocationQuantity,0)
                     else STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                  end
                  - isnull(HoldQty,0)
                  + isnull(case when AllocHoldQty > HoldQty then HoldQty else AllocHoldQty end,0)
                 >=  (0.5/power(10,QUANTITY_DPS))
                )
               or
               (WMSPD_HOLD_REF <> ''''
                  and 
                     case STK_MULTILOCATN 
                        when 1 then isnull(SitePhsQty,0) - isnull(ssr.AllocationQuantity,0) - isnull(swsr.AllocationQuantity,0)
                        else STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                     end
                     >=  (0.5/power(10,QUANTITY_DPS))
                  and 
                     isnull(HoldRefQty,0) - isnull(AllocHoldRefQty,0) >=  (0.5/power(10,QUANTITY_DPS))
                )
               )'
         if @PS_IncludeFullyAllocatedLines = 1
            set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13)
               + ' or ( (WC_QUANTITY_REQUIRED-WC_QUANTITY_ISSUED) - isnull(WMWR_QUANTITY,0) <=  (0.5/power(10,QUANTITY_DPS)) )'

         set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13) + 
             + ')'
      end

      if @PS_OnlyShowLinesWithAvailableStock = 1 and isnull(@LS_WMSS_SITE_ANALYSIS,'') = ''
         begin
            set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13)
            + ' and 
                  ((
                   (STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                     - isnull(HoldQty,0)
                     + isnull(case when AllocHoldQty > HoldQty then HoldQty else AllocHoldQty end,0)
                    >=  (0.5/power(10,QUANTITY_DPS))
                   )
                  or
                  (WMSPD_HOLD_REF <> ''''
                     and 
                        STK_PHYSICAL + STK_QTYPRINTED - isnull(sr.AllocationQuantity,0) - isnull(swr.AllocationQuantity,0)
                        >=  (0.5/power(10,QUANTITY_DPS))
                     and 
                        isnull(HoldRefQty,0) - isnull(AllocHoldRefQty,0) >=  (0.5/power(10,QUANTITY_DPS))
                   )
                  )'
            if @PS_IncludeFullyAllocatedLines = 1
               set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13)
                  + ' or ( (WC_QUANTITY_REQUIRED-WC_QUANTITY_ISSUED) - isnull(WMWR_QUANTITY,0) <=  (0.5/power(10,QUANTITY_DPS)) )'

            set @LS_WO_WhereClause = @LS_WO_WhereClause + char(13) + 
                + ')'
         end

      if @LS_WO_IncludeExtraWhereClause = 1
         begin
            set @LS_WO_ExtraWhereClause = ' and exists(select 1 from ORD_DETAIL'
                                          +' join ORD_HEADER on OD_ORDER_NUMBER = OH_ORDER_NUMBER'
                                          +' join SL_ACCOUNTS on CU_ACC_CODE = OH_ACCOUNT_ORDER'
                                          +' where OD_WO_NUMBER=WC_ORDER_NUMBER'
                                          + @LS_WO_ExtraWhereClause
                                          + ')'

            set @LS_WO_SQLStatement    =  ' select '
                                       +  @LS_WO_Fields
                                       +  ' from '
                                       +  @LS_WO_TableNames
                                       +  ' where '
                                       +  @LS_WO_WhereClause
                                       +  @LS_WO_ExtraWhereClause
         end
      else
         set @LS_WO_SQLStatement       =  ' select '
                                       +  @LS_WO_Fields
                                       +  ' from '
                                       +  @LS_WO_TableNames
                                       +  ' where '
                                       +  @LS_WO_WhereClause
   end    --of test on  'If @PS_Include_WorksOrders = 1'

--update [SL_TRANSACTION_NOTES] set ST_NOTE = @LS_SOP_SQLStatement
   
if       @PS_Include_SalesOrders = 1
   and   @PS_Include_WorksOrders = 1      --searching for sales orders and works orders
   begin
      set @LS_Main_SQLStatement  =  @LS_SOP_SQLStatement + char(13)
                                 +  ' UNION ' + char(13)
                                 +  @LS_WO_SQLStatement + char(13)
                                 +  ' order by' + char(13)
                                 +  ' stockcode, Site'
      execute sp_executesql
         @LS_Main_SQLStatement
      ,  N'    @PS_OrderStatus               varchar(20)
            ,  @PS_RequiredByDateFrom        datetime
            ,  @PS_RequiredByDateTo          datetime
            ,  @PS_OrderDateFrom             datetime
            ,  @PS_OrderDateTo               datetime
            ,  @PS_PeriodFrom                tinyint
            ,  @PS_PeriodTo                  tinyint
            ,  @PS_Year                      varchar(1)
            ,  @PS_OrderNumberFrom           int
            ,  @PS_OrderNumberTo             int
            ,  @PS_BatchRefFrom              varchar(10)
            ,  @PS_BatchRefTo                varchar(10)
            ,  @PS_StockCodeFrom             varchar(25)
            ,  @PS_StockCodeTo               varchar(25)
            ,  @PS_Site                      varchar(25)
            ,  @PS_CustomerFrom              varchar(10)
            ,  @PS_CustomerTo                varchar(10)
            ,  @PS_DeliveryPostcodeFrom      varchar(12)
            ,  @PS_DeliveryPostcodeTo        varchar(12)
            ,  @PS_CustomerSortKeyFrom       varchar(20)
            ,  @PS_CustomerSortKeyTo         varchar(20)
            ,  @PS_UserIDFrom                varchar(4)
            ,  @PS_UserIDTo                  varchar(4)
            ,  @PS_UserKey1From              varchar(20)
            ,  @PS_UserKey1To                varchar(20)
            ,  @PS_UserKey2From              varchar(20)
            ,  @PS_UserKey2To                varchar(20)
            ,  @PS_UserKey3From              varchar(20)
            ,  @PS_UserKey3To                varchar(20)
            ,  @PS_UserID                    varchar(4)
            ,  @PS_FinishDateFrom            datetime
            ,  @PS_FinishDateTo              datetime
            ,  @PS_TopLevelWONumberFrom      int
            ,  @PS_TopLevelWONumberTo        int
            ,  @PS_WorksOrderNumberFrom      int
            ,  @PS_WorksOrderNumberTo        int
            ,  @PS_AssemblyStockCodeFrom     varchar(25)
            ,  @PS_AssemblyStockCodeTo       varchar(25)
            ,  @PS_ComponentStockCodeFrom    varchar(25)
            ,  @PS_ComponentStockCodeTo      varchar(25)
            ,  @PS_RouteCodeFrom             varchar(10)
            ,  @PS_RouteCodeTo               varchar(10)
            ,  @PS_WOSortKeyFrom             varchar(20)
            ,  @PS_WOSortKeyTo               varchar(20)
            ,  @PS_WOPriorityFrom            int
            ,  @PS_WOPriorityTo              int
            ,  @PS_WO_CustomerCodeFrom       varchar(10)
            ,  @PS_WO_CustomerCodeTo         varchar(10)
            ,  @PS_WO_CustomerSortKeyFrom    varchar(20)
            ,  @PS_WO_CustomerSortKeyTo      varchar(20)
            ,  @PS_WO_CustomerUserKey1From   varchar(20)
            ,  @PS_WO_CustomerUserKey1To     varchar(20)
            ,  @PS_WO_CustomerUserKey2From   varchar(20)
            ,  @PS_WO_CustomerUserKey2To     varchar(20)
            ,  @PS_WO_CustomerUserKey3From   varchar(20)
            ,  @PS_WO_CustomerUserKey3To     varchar(20)
            ,  @PS_ComponentSite             varchar(25)
         '
      ,  @PS_OrderStatus               = @PS_OrderStatus
      ,  @PS_RequiredByDateFrom        = @PS_RequiredByDateFrom
      ,  @PS_RequiredByDateTo          = @PS_RequiredByDateTo
      ,  @PS_OrderDateFrom             = @PS_OrderDateFrom
      ,  @PS_OrderDateTo               = @PS_OrderDateTo
      ,  @PS_PeriodFrom                = @PS_PeriodFrom
      ,  @PS_PeriodTo                  = @PS_PeriodTo
      ,  @PS_Year                      = @PS_Year
      ,  @PS_OrderNumberFrom           = @PS_OrderNumberFrom
      ,  @PS_OrderNumberTo             = @PS_OrderNumberTo
      ,  @PS_BatchRefFrom              = @PS_BatchRefFrom
      ,  @PS_BatchRefTo                = @PS_BatchRefTo
      ,  @PS_StockCodeFrom             = @PS_StockCodeFrom
      ,  @PS_StockCodeTo               = @PS_StockCodeTo
      ,  @PS_Site                      = @PS_Site
      ,  @PS_CustomerFrom              = @PS_CustomerFrom
      ,  @PS_CustomerTo                = @PS_CustomerTo
      ,  @PS_DeliveryPostcodeFrom      = @PS_DeliveryPostcodeFrom
      ,  @PS_DeliveryPostcodeTo        = @PS_DeliveryPostcodeTo
      ,  @PS_CustomerSortKeyFrom       = @PS_CustomerSortKeyFrom
      ,  @PS_CustomerSortKeyTo         = @PS_CustomerSortKeyTo
      ,  @PS_UserIDFrom                = @PS_UserIDFrom
      ,  @PS_UserIDTo                  = @PS_UserIDTo
      ,  @PS_UserKey1From              = @PS_UserKey1From
      ,  @PS_UserKey1To                = @PS_UserKey1To
      ,  @PS_UserKey2From              = @PS_UserKey2From
      ,  @PS_UserKey2To                = @PS_UserKey2To
      ,  @PS_UserKey3From              = @PS_UserKey3From
      ,  @PS_UserKey3To                = @PS_UserKey3To
      ,  @PS_UserID                    = @PS_UserID
      ,  @PS_FinishDateFrom            = @PS_FinishDateFrom
      ,  @PS_FinishDateTo              = @PS_FinishDateTo
      ,  @PS_TopLevelWONumberFrom      = @PS_TopLevelWONumberFrom
      ,  @PS_TopLevelWONumberTo        = @PS_TopLevelWONumberTo
      ,  @PS_WorksOrderNumberFrom      = @PS_WorksOrderNumberFrom
      ,  @PS_WorksOrderNumberTo        = @PS_WorksOrderNumberTo
      ,  @PS_AssemblyStockCodeFrom     = @PS_AssemblyStockCodeFrom
      ,  @PS_AssemblyStockCodeTo       = @PS_AssemblyStockCodeTo
      ,  @PS_ComponentStockCodeFrom    = @PS_ComponentStockCodeFrom
      ,  @PS_ComponentStockCodeTo      = @PS_ComponentStockCodeTo
      ,  @PS_RouteCodeFrom             = @PS_RouteCodeFrom
      ,  @PS_RouteCodeTo               = @PS_RouteCodeTo
      ,  @PS_WOSortKeyFrom             = @PS_WOSortKeyFrom
      ,  @PS_WOSortKeyTo               = @PS_WOSortKeyTo
      ,  @PS_WOPriorityFrom            = @PS_WOPriorityFrom
      ,  @PS_WOPriorityTo              = @PS_WOPriorityTo
      ,  @PS_WO_CustomerCodeFrom       = @PS_WO_CustomerCodeFrom
      ,  @PS_WO_CustomerCodeTo         = @PS_WO_CustomerCodeTo
      ,  @PS_WO_CustomerSortKeyFrom    = @PS_WO_CustomerSortKeyFrom
      ,  @PS_WO_CustomerSortKeyTo      = @PS_WO_CustomerSortKeyTo
      ,  @PS_WO_CustomerUserKey1From   = @PS_WO_CustomerUserKey1From
      ,  @PS_WO_CustomerUserKey1To     = @PS_WO_CustomerUserKey1To
      ,  @PS_WO_CustomerUserKey2From   = @PS_WO_CustomerUserKey2From
      ,  @PS_WO_CustomerUserKey2To     = @PS_WO_CustomerUserKey2To
      ,  @PS_WO_CustomerUserKey3From   = @PS_WO_CustomerUserKey3From
      ,  @PS_WO_CustomerUserKey3To     = @PS_WO_CustomerUserKey3To
      ,  @PS_ComponentSite             = @PS_ComponentSite
   end

if       @PS_Include_SalesOrders = 1
   and   @PS_Include_WorksOrders = 0      --searching for sales orders only
   begin
      set @LS_Main_SQLStatement  =  @LS_SOP_SQLStatement + char(13)
                                 +  ' order by' + char(13)
                                 +  ' stockcode, Site'
      execute sp_executesql
         @LS_Main_SQLStatement
      ,  N'    @PS_OrderStatus            varchar(20)
            ,  @PS_RequiredByDateFrom     datetime
            ,  @PS_RequiredByDateTo       datetime
            ,  @PS_OrderDateFrom          datetime
            ,  @PS_OrderDateTo            datetime
            ,  @PS_PeriodFrom             tinyint
            ,  @PS_PeriodTo               tinyint
            ,  @PS_Year                   varchar(1)
            ,  @PS_OrderNumberFrom        int
            ,  @PS_OrderNumberTo          int
            ,  @PS_BatchRefFrom           varchar(10)
            ,  @PS_BatchRefTo             varchar(10)
            ,  @PS_StockCodeFrom          varchar(25)
            ,  @PS_StockCodeTo            varchar(25)
            ,  @PS_Site                   varchar(25)
            ,  @PS_CustomerFrom           varchar(10)
            ,  @PS_CustomerTo             varchar(10)
            ,  @PS_DeliveryPostcodeFrom   varchar(12)
            ,  @PS_DeliveryPostcodeTo     varchar(12)
            ,  @PS_CustomerSortKeyFrom    varchar(20)
            ,  @PS_CustomerSortKeyTo      varchar(20)
            ,  @PS_UserIDFrom             varchar(4)
            ,  @PS_UserIDTo               varchar(4)
            ,  @PS_UserKey1From           varchar(20)
            ,  @PS_UserKey1To             varchar(20)
            ,  @PS_UserKey2From           varchar(20)
            ,  @PS_UserKey2To             varchar(20)
            ,  @PS_UserKey3From           varchar(20)
            ,  @PS_UserKey3To             varchar(20)
            ,  @PS_UserID                 varchar(4)
         '
      ,  @PS_OrderStatus            = @PS_OrderStatus
      ,  @PS_RequiredByDateFrom     = @PS_RequiredByDateFrom
      ,  @PS_RequiredByDateTo       = @PS_RequiredByDateTo
      ,  @PS_OrderDateFrom          = @PS_OrderDateFrom
      ,  @PS_OrderDateTo            = @PS_OrderDateTo
      ,  @PS_PeriodFrom             = @PS_PeriodFrom
      ,  @PS_PeriodTo               = @PS_PeriodTo
      ,  @PS_Year                   = @PS_Year
      ,  @PS_OrderNumberFrom        = @PS_OrderNumberFrom
      ,  @PS_OrderNumberTo          = @PS_OrderNumberTo
      ,  @PS_BatchRefFrom           = @PS_BatchRefFrom
      ,  @PS_BatchRefTo             = @PS_BatchRefTo
      ,  @PS_StockCodeFrom          = @PS_StockCodeFrom
      ,  @PS_StockCodeTo            = @PS_StockCodeTo
      ,  @PS_Site                   = @PS_Site
      ,  @PS_CustomerFrom           = @PS_CustomerFrom
      ,  @PS_CustomerTo             = @PS_CustomerTo
      ,  @PS_DeliveryPostcodeFrom   = @PS_DeliveryPostcodeFrom
      ,  @PS_DeliveryPostcodeTo     = @PS_DeliveryPostcodeTo
      ,  @PS_CustomerSortKeyFrom    = @PS_CustomerSortKeyFrom
      ,  @PS_CustomerSortKeyTo      = @PS_CustomerSortKeyTo
      ,  @PS_UserIDFrom             = @PS_UserIDFrom
      ,  @PS_UserIDTo               = @PS_UserIDTo
      ,  @PS_UserKey1From           = @PS_UserKey1From
      ,  @PS_UserKey1To             = @PS_UserKey1To
      ,  @PS_UserKey2From           = @PS_UserKey2From
      ,  @PS_UserKey2To             = @PS_UserKey2To
      ,  @PS_UserKey3From           = @PS_UserKey3From
      ,  @PS_UserKey3To             = @PS_UserKey3To
      ,  @PS_UserID                 = @PS_UserID
   end

if       @PS_Include_SalesOrders = 0
   and   @PS_Include_WorksOrders = 1      --searching for works orders only
   begin
      set @LS_Main_SQLStatement  =  @LS_WO_SQLStatement + char(13)
                                 +  ' order by' + char(13)
                                 +  ' stockcode, Site'
      execute sp_executesql
         @LS_Main_SQLStatement
      ,  N'
               @PS_FinishDateFrom            datetime
            ,  @PS_FinishDateTo              datetime
            ,  @PS_TopLevelWONumberFrom      int
            ,  @PS_TopLevelWONumberTo        int
            ,  @PS_WorksOrderNumberFrom      int
            ,  @PS_WorksOrderNumberTo        int
            ,  @PS_AssemblyStockCodeFrom     varchar(25)
            ,  @PS_AssemblyStockCodeTo       varchar(25)
            ,  @PS_ComponentStockCodeFrom    varchar(25)
            ,  @PS_ComponentStockCodeTo      varchar(25)
            ,  @PS_RouteCodeFrom             varchar(10)
            ,  @PS_RouteCodeTo               varchar(10)
            ,  @PS_WOSortKeyFrom             varchar(20)
            ,  @PS_WOSortKeyTo               varchar(20)
            ,  @PS_WOPriorityFrom            int
            ,  @PS_WOPriorityTo              int
            ,  @PS_WO_CustomerCodeFrom       varchar(10)
            ,  @PS_WO_CustomerCodeTo         varchar(10)
            ,  @PS_WO_CustomerSortKeyFrom    varchar(20)
            ,  @PS_WO_CustomerSortKeyTo      varchar(20)
            ,  @PS_WO_CustomerUserKey1From   varchar(20)
            ,  @PS_WO_CustomerUserKey1To     varchar(20)
            ,  @PS_WO_CustomerUserKey2From   varchar(20)
            ,  @PS_WO_CustomerUserKey2To     varchar(20)
            ,  @PS_WO_CustomerUserKey3From   varchar(20)
            ,  @PS_WO_CustomerUserKey3To     varchar(20)
            ,  @PS_ComponentSite             varchar(25)
            ,  @PS_UserID                    varchar(4)
         '
      ,  @PS_FinishDateFrom            = @PS_FinishDateFrom
      ,  @PS_FinishDateTo              = @PS_FinishDateTo
      ,  @PS_TopLevelWONumberFrom      = @PS_TopLevelWONumberFrom
      ,  @PS_TopLevelWONumberTo        = @PS_TopLevelWONumberTo
      ,  @PS_WorksOrderNumberFrom      = @PS_WorksOrderNumberFrom
      ,  @PS_WorksOrderNumberTo        = @PS_WorksOrderNumberTo
      ,  @PS_AssemblyStockCodeFrom     = @PS_AssemblyStockCodeFrom
      ,  @PS_AssemblyStockCodeTo       = @PS_AssemblyStockCodeTo
      ,  @PS_ComponentStockCodeFrom    = @PS_ComponentStockCodeFrom
      ,  @PS_ComponentStockCodeTo      = @PS_ComponentStockCodeTo
      ,  @PS_RouteCodeFrom             = @PS_RouteCodeFrom
      ,  @PS_RouteCodeTo               = @PS_RouteCodeTo
      ,  @PS_WOSortKeyFrom             = @PS_WOSortKeyFrom
      ,  @PS_WOSortKeyTo               = @PS_WOSortKeyTo
      ,  @PS_WOPriorityFrom            = @PS_WOPriorityFrom
      ,  @PS_WOPriorityTo              = @PS_WOPriorityTo
      ,  @PS_WO_CustomerCodeFrom       = @PS_WO_CustomerCodeFrom
      ,  @PS_WO_CustomerCodeTo         = @PS_WO_CustomerCodeTo
      ,  @PS_WO_CustomerSortKeyFrom    = @PS_WO_CustomerSortKeyFrom
      ,  @PS_WO_CustomerSortKeyTo      = @PS_WO_CustomerSortKeyTo
      ,  @PS_WO_CustomerUserKey1From   = @PS_WO_CustomerUserKey1From
      ,  @PS_WO_CustomerUserKey1To     = @PS_WO_CustomerUserKey1To
      ,  @PS_WO_CustomerUserKey2From   = @PS_WO_CustomerUserKey2From
      ,  @PS_WO_CustomerUserKey2To     = @PS_WO_CustomerUserKey2To
      ,  @PS_WO_CustomerUserKey3From   = @PS_WO_CustomerUserKey3From
      ,  @PS_WO_CustomerUserKey3To     = @PS_WO_CustomerUserKey3To
      ,  @PS_ComponentSite             = @PS_ComponentSite
      ,  @PS_UserID                    = @PS_UserID
   end

set @PS_LOCK = @LS_Locked

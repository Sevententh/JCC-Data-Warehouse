CREATE VIEW [dbo].[AA_ORDER_VIEW_UDEF_STOCK_QUANTITIES_DELTA]
/***********************************************************************
* Author:          
 * Create Date:     
 * Description:     Returns Stock Quantities based on Delta tables
* Version History: 
 * v1.0   - Initial Version
***********************************************************************/
AS
with siteStock as (
                SELECT 
                LOC_STOCK_CODE StockCode,
                CASE LOC_USERSORT1 
                                WHEN '' 
                                THEN LOC_CODE 
                                ELSE LOC_USERSORT1 
                END SiteCode,
                SUM(LOC_PHYSICAL) Physical,
                SUM(LOC_RESERVE_OUT) OnHold
FROM
                STK_LOCATION (NOLOCK)
GROUP BY
                LOC_STOCK_CODE
                ,CASE LOC_USERSORT1 
                                WHEN '' 
                                THEN LOC_CODE 
                                ELSE LOC_USERSORT1 
                END

), onOrder as (
SELECT
                POD_STOCK_CODE 'StockCode',
                WMSM_SITECODE 'SiteCode',
                SUM(POD_QTYORD - POD_QTYDELVD) 'OnOrder'
FROM
                POP_HEADER (NOLOCK)
                inner join POP_DETAIL (NOLOCK)
                ON POH_ORDER_NUMBR = POD_ORDER_NO
                left join SDK_WMS_SITE_MAP
                ON POH_DEL_ADD = WMSM_COAD_PRIMARY
                                and POH_DEL_ADD_POINT = 'CO'
WHERE
                POD_QTYORD - POD_QTYDELVD > 0
GROUP BY 
                POD_STOCK_CODE,
                WMSM_SITECODE
)

SELECT
                STKCODE                                                                                                                                             'Stock Code',
                STKNAME                                                                                                                                            'Description',
                isnull(siteStock.SiteCode,'')                                         'Site',
                isnull(Physical,STK_PHYSICAL)                                    'Physical',
                isnull(OnHold,STK_RESERVE_OUT)                                           'On Hold',
                isnull(AllocationQuantity,0)                                         'Warehouse Allocated',
                STK_BACK_ORDER_QTY - isnull(AllocationQuantity,0) 'Unallocated Orders',
                isnull(Physical,STK_PHYSICAL) -
                isnull(OnHold,STK_RESERVE_OUT) - 
                isnull(AllocationQuantity,0)                                         'Free',
                isnull(onOrder.OnOrder,0)                                                          'On Order In'
FROM
                STK_STOCK (NOLOCK)
                LEFT JOIN siteStock
                ON STKCODE = siteStock.StockCode
                LEFT JOIN SDK_WMS_STOCK_SITE_RESERVATION_VIEW (NOLOCK)
                ON STK_PRIMARY = StockLink
                                and SiteCode = [Site]
                LEFT JOIN onOrder
                ON STKCODE = onOrder.StockCode
                                and siteStock.SiteCode = onOrder.SiteCode
WHERE 
                isnull(siteStock.SiteCode,'') = 'BOGNOR'

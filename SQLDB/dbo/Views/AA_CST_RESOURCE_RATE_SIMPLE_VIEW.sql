create view AA_CST_RESOURCE_RATE_SIMPLE_VIEW

/*
** Returns a table to be used specifically with AA_CST_RESOURCE_RATE_LIST_S
**
** Written     :  01/12/2005 SR
** Last Amended:  06/01/2006 DB
**
*/

as

select
   cast(
         convert(nvarchar,CR_RESOURCE_LINK)
         +
         convert(nvarchar,CR_RATE_NUMBER)
         as bigint
       )                                     as [PRIMARY]               -- Unique ID
,  isnull(PRNAME, '')                        as RATE_DESCRIPTION        -- Resource name
,  CR_COST_PRICE                                                        -- Home Cost Price
,  CR_SALES_PRICE                                                       -- Sales Price
,  CR_UPLIFT_P                                                          -- Uplift Percentage
,  CR_UPLIFT_VALUE                                                      -- Home Uplift Value
,  CR_MARGIN_P                                                          -- Margin Percent
,  CR_MARGIN_VALUE                                                      -- Margin Value

,  CR_COST_PRICE_C                                                      -- Currency Cost Price
,  CR_SALES_PRICE_C                                                     -- Currency Sales Price
,  CR_UPLIFT_VALUE_C                                                    -- Currency Uplift Value
,  CR_MARGIN_VALUE_C                                                    -- Currency Margin Value

,  CR_RESOURCE_LINK                                                     -- link to PRC_PRICE_RECS
,  CR_RATE_NUMBER                                                       -- Resource rate number, id
   from
      CST_RESOURCE_RATE
         left join PRC_PRICE_RECS on CR_RESOURCE_LINK = PR_PRIMARY
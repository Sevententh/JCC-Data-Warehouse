create view AA_STK_STOCK_FACETS_VIEW
/*
** View to see facets of a stock item
**
** Written:      21/10/13 NC   
** Last Amended: 30/10/13 NC, 1/11/2013 RL, 5/11/13 NC
*/
as
select
    stk.STK_PRIMARY                 as StockPrimary
  , stk.STKCODE                     as StockCode
  , stk.STK_FACET_TEMPLATE_FLAG     as IsFacetTemplate
  , isnull(g.SFPG_NAME,'')          as ProductGroupName
  , isnull(ft.STKCODE,'')           as FacetTemplateCode
  , isnull(ft.STKNAME,'')           as FacetTemplateName
  
  , isnull(f1.SFCT_DESCRIPTION,'')  as Facet1Label
  , isnull(f1.SFCT_PRIMARY,0)       as Facet1Primary
  , isnull(fv1.SFV_VALUE,'')        as Facet1Value
  , isnull(fv1.SFV_PRIMARY,0)       as Facet1ValuePrimary
  
  , isnull(f2.SFCT_DESCRIPTION,'')  as Facet2Label
  , isnull(f2.SFCT_PRIMARY,0)       as Facet2Primary
  , isnull(fv2.SFV_VALUE,'')        as Facet2Value
  , isnull(fv2.SFV_PRIMARY,0)       as Facet2ValuePrimary

  , isnull(f3.SFCT_DESCRIPTION,'')  as Facet3Label
  , isnull(f3.SFCT_PRIMARY,0)       as Facet3Primary
  , isnull(fv3.SFV_VALUE,'')        as Facet3Value
  , isnull(fv3.SFV_PRIMARY,0)       as Facet3ValuePrimary
   from
      STK_STOCK as stk with(nolock) 
      left join STK_STOCK as ft with(nolock) on ft.STK_PRIMARY = stk.STK_FACET_TEMPLATE_LINK
      
      left join STK_FACET_PRODUCT_GROUP as g on g.SFPG_PRIMARY = stk.STK_FACET_PRODUCT_GROUP_LINK
  
      left join STK_FACET_PRODUCT_GROUP_LINKS as gl1 on gl1.SFPGL_PRODUCT_GROUP_LINK = g.SFPG_PRIMARY and gl1.SFPGL_FACET_NUMBER = 1
      left join STK_FACETS f1 on f1.SFCT_PRIMARY = gl1.SFPGL_FACET_LINK
      left join STK_FACET_LINKS fl1  on f1.SFCT_PRIMARY = fl1.SFL_FACET_LINK
                         and fl1.SFL_STOCK_LINK = stk.STK_PRIMARY
      left join STK_FACET_VALUES fv1 on fv1.SFV_PRIMARY  = fl1.SFL_FACET_VALUE_LINK
      
      left join STK_FACET_PRODUCT_GROUP_LINKS as gl2 on gl2.SFPGL_PRODUCT_GROUP_LINK = g.SFPG_PRIMARY and gl2.SFPGL_FACET_NUMBER = 2
      left join STK_FACETS f2 on f2.SFCT_PRIMARY = gl2.SFPGL_FACET_LINK
      left join STK_FACET_LINKS fl2  on f2.SFCT_PRIMARY = fl2.SFL_FACET_LINK
                         and fl2.SFL_STOCK_LINK = stk.STK_PRIMARY
      left join STK_FACET_VALUES fv2 on fv2.SFV_PRIMARY  = fl2.SFL_FACET_VALUE_LINK
      
      left join STK_FACET_PRODUCT_GROUP_LINKS as gl3 on gl3.SFPGL_PRODUCT_GROUP_LINK = g.SFPG_PRIMARY and gl3.SFPGL_FACET_NUMBER = 3
      left join STK_FACETS f3 on f3.SFCT_PRIMARY = gl3.SFPGL_FACET_LINK
      left join STK_FACET_LINKS fl3  on f3.SFCT_PRIMARY = fl3.SFL_FACET_LINK
                         and fl3.SFL_STOCK_LINK = stk.STK_PRIMARY
      left join STK_FACET_VALUES fv3 on fv3.SFV_PRIMARY  = fl3.SFL_FACET_VALUE_LINK
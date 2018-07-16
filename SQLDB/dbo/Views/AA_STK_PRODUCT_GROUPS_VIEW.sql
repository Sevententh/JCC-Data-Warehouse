create view AA_STK_PRODUCT_GROUPS_VIEW
/*
** View to see facet types of a product group
**
** Written:      29/10/2013 NC   
** Last Amended: 
*/
as
select
    SFPG_PRIMARY                    as ProductGroupPrimary
  , SFPG_NAME                       as Name
  , SFPG_USER_PUTIN                 as UserEntered
  , SFPG_DATE_PUTIN                 as DateEntered
  , SFPG_USER_EDITED                as UserEdited
  , SFPG_DATE_EDITED                as DateEdited
  , SFPG_SOURCE                     as Source
  , f1.SFCT_PRIMARY                 as Facet1Primary
  , f1.SFCT_DESCRIPTION             as Facet1Description
  , f2.SFCT_PRIMARY                 as Facet2Primary
  , f2.SFCT_DESCRIPTION             as Facet2Description
  , f3.SFCT_PRIMARY                 as Facet3Primary
  , f3.SFCT_DESCRIPTION             as Facet3Description
   from
      STK_FACET_PRODUCT_GROUP with(nolock)

      left join STK_FACET_PRODUCT_GROUP_LINKS fl1  on SFPG_PRIMARY = fl1.SFPGL_PRODUCT_GROUP_LINK and fl1.SFPGL_FACET_NUMBER = 1
      left join STK_FACETS f1 on f1.SFCT_PRIMARY = fl1.SFPGL_FACET_LINK
    
      left join STK_FACET_PRODUCT_GROUP_LINKS fl2  on SFPG_PRIMARY = fl2.SFPGL_PRODUCT_GROUP_LINK and fl2.SFPGL_FACET_NUMBER = 2
      left join STK_FACETS f2 on f2.SFCT_PRIMARY = fl2.SFPGL_FACET_LINK
      
      left join STK_FACET_PRODUCT_GROUP_LINKS fl3  on SFPG_PRIMARY = fl3.SFPGL_PRODUCT_GROUP_LINK and fl3.SFPGL_FACET_NUMBER = 3
      left join STK_FACETS f3 on f3.SFCT_PRIMARY = fl3.SFPGL_FACET_LINK
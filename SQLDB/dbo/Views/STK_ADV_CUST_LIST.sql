create view    STK_ADV_CUST_LIST
as
select distinct
   STKC_PARENT
,  CUCODE
,  CUNAME
   from
      STK_PRICE_LIST_CUST with(nolock)
         inner join  SL_ACCOUNTS             with(nolock)   on       STKC_EXCLUDE            =  0
                                                               and   (
                                                                        (
                                                                                 CUCODE      =  STKC_CHAR 
                                                                           and   STKC_TYPE   =  'C' 
                                                                        )                      
                                                                        or                     
                                                                        (                      
                                                                                 CUSORT      =  STKC_CHAR 
                                                                           and   STKC_TYPE   = 'S' 
                                                                        )                      
                                                                        or                     
                                                                        (                      
                                                                                 CUUSER1     =  STKC_CHAR 
                                                                           and   STKC_TYPE   = '1' 
                                                                        )                      
                                                                        or                     
                                                                        (                      
                                                                                 CUUSER2     =  STKC_CHAR 
                                                                           and   STKC_TYPE   =  '2'
                                                                        )                      
                                                                        or                     
                                                                        (                      
                                                                                 CUUSER3     =  STKC_CHAR 
                                                                           and   STKC_TYPE   =  '3'
                                                                        )
                                                                     )
                                                               and   isnull(CUCODE,'')       <> ''
         left  join  STK_ADV_PRICE_EXCLUDE   with(nolock)   on       XID                     =  STKC_PARENT
                                                               and   CUCODE                  =  XCODE
   where
      XID is null
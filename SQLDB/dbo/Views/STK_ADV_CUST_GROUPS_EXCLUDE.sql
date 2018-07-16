create view    STK_ADV_CUST_GROUPS_EXCLUDE
as
select distinct
   STKC_PARENT as XGROUPID
,  STKC_CHAR   as XGROUPCODE
,  STKC_TYPE   as XGROUPTYPE
   from
      STK_PRICE_LIST_CUST with(nolock)
         inner join SL_ACCOUNTS  with(nolock)   on       STKC_EXCLUDE               =  1
                                                   and   (
                                                            (
                                                                     CUCODE         =  STKC_CHAR 
                                                               and   STKC_TYPE      =  'C' 
                                                            )                         
                                                            or                        
                                                            (                         
                                                                     CUSORT         =  STKC_CHAR
                                                               and   STKC_TYPE      =  'S' 
                                                            )                         
                                                            or                        
                                                            (                         
                                                                     CUUSER1        =  STKC_CHAR
                                                               and   STKC_TYPE      =  '1' 
                                                            )                         
                                                            or                        
                                                            (                         
                                                                     CUUSER2        =  STKC_CHAR
                                                               and   STKC_TYPE      =  '2' 
                                                            )                         
                                                            or                        
                                                            (                         
                                                                     CUUSER3        =  STKC_CHAR 
                                                               and   STKC_TYPE      =  '3' 
                                                            )
                                                         )
                                                   and   isnull(CUCODE,'')          <> ''
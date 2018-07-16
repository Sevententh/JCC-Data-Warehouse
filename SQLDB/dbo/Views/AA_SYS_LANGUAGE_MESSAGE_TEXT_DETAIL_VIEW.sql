create view AA_SYS_LANGUAGE_MESSAGE_TEXT_DETAIL_VIEW
/*
** Returns a table to be used specifically with AA_SYS_LANGUAGE_MESSAGE_TEXT_DETAIL_LIST_S
** Written:      03/10/05 NC
** Last Amended: 
**
*/
as

select
     LK.LANGUAGE_MESSAGE_LINK_PRIMARY  as [PRIMARY] -- Detail Primary
   ,      convert(decimal(21,0),'1' + replicate('0',10 - len(convert(nvarchar(10),(LK.LANGUAGE_MESSAGE_FK))))
   + convert(nvarchar(10),(LK.LANGUAGE_MESSAGE_FK))
   + convert(nvarchar(20),(LK.LANGUAGE_MESSAGE_TEXT_FK)))
                                       as [HEADER_PRIMARY] -- Link to header
   , LK.LANGUAGE_FK                    as LANGUAGE_PRIMARY -- needed for search
   , LL.FORM_KEY                       as FORM_KEY
   , LL.MESSAGE_TAG                    as MESSAGE_TAG
   , cast(1 as bit)                    as APPLY_CHANGE
   , LK.LANGUAGE_MESSAGE_FK            as LANGUAGE_MESSAGE_FK      -- (Hidden) Needed for optimised indexed join)
   , LK.LANGUAGE_MESSAGE_TEXT_FK       as LANGUAGE_MESSAGE_TEXT_FK -- (Hidden) Needed for optimised indexed join)
   
   from SYS_LANGUAGE_MESSAGE_TEXT_LINK as LK
            join SYS_LANGUAGE_MESSAGES as LL on LL.LANGUAGE_MESSAGE_PRIMARY = LK.LANGUAGE_MESSAGE_FK
create view AA_SYS_LANGUAGE_MESSAGE_TEXT_HEADER_VIEW
/*
** Returns a table to be used specifically with AA_SYS_LANGUAGE_TEXT_HEADER_LIST_S
** Written:      03/10/05 NC
** Last Amended: 10/10/05 SR, 10/10/05 NC
**
*/
as

select
     convert(decimal(21,0),'1' + replicate('0',10 - len(convert(nvarchar(10),max(LK.LANGUAGE_MESSAGE_FK))))
   + convert(nvarchar(10),max(LK.LANGUAGE_MESSAGE_FK))
   + convert(nvarchar(20),max(LK.LANGUAGE_MESSAGE_TEXT_FK))) 
                                       as [PRIMARY]
   , max(LK.LANGUAGE_FK)               as LANGUAGE_PRIMARY -- needed for search
   , T.LANGUAGE_MESSAGE_TEXT_PRIMARY   as [TEXT_PRIMARY] -- Link to Text
   , T.LANGUAGE_MESSAGE_TEXT           as LANGUAGE_MESSAGE_TEXT
   , max(LK.MODIFIED_DATE)             as MODIFIED_DATE
   , M.DESCRIPTION                     as [DESCRIPTION]
   , max(LK.LANGUAGE_MESSAGE_FK)       as LANGUAGE_MESSAGE_FK      -- (Hidden) Needed for optimised indexed join)
   , max(LK.LANGUAGE_MESSAGE_TEXT_FK)  as LANGUAGE_MESSAGE_TEXT_FK -- (Hidden) Needed for optimised indexed join)

   from SYS_LANGUAGE_MESSAGE_TEXT as T
      join SYS_LANGUAGE_MESSAGE_TEXT_LINK as LK on LK.LANGUAGE_MESSAGE_TEXT_FK = T.LANGUAGE_MESSAGE_TEXT_PRIMARY
      join SYS_LANGUAGE_MESSAGES as M on M.LANGUAGE_MESSAGE_PRIMARY = LK.LANGUAGE_MESSAGE_FK

   group by T.LANGUAGE_MESSAGE_TEXT_PRIMARY, T.LANGUAGE_MESSAGE_TEXT, M.[DESCRIPTION]

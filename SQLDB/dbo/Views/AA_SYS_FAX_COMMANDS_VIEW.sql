create view AA_SYS_FAX_COMMANDS_VIEW

/*
** Written     :  20/06/2005 DB
** Last Amended:  20/06/2005 DB
** Comments    :  Returns fax command templates.
**             :  A where clause should be applied to the view for it to make sense:
**             :     SFS_PRIMARY    should be used to specify which template to select.
**             :     LANGCODE_DEF17 should be used to specify which language to return the fax command labels in.
*/
(
   SFS_PRIMARY
,  SFS_SOFTWARE_NAME
,  SFS_PROTECTED
,  SFL_LABEL
,  FaxLanguageLabel
,  SFT_TEMPLATE1
,  SFT_TEMPLATE2
)
as
select
   SFS_PRIMARY
,  SFS_SOFTWARE_NAME
,  SFS_PROTECTED
,  SFL_LABEL
,  case SFL_LABEL
      when 'ADDRESSEE'     then FAX_ADDRESSEE
      when 'COMP_ADDRESS'  then FAX_COMP_ADDRESS
      when 'COMP_COUNTRY'  then FAX_COMP_COUNTRY
      when 'COMP_EMAIL'    then FAX_COMP_EMAIL
      when 'COMP_FAX'      then FAX_COMP_FAX
      when 'COMP_NAME'     then FAX_COMP_NAME
      when 'COMP_PCODE'    then FAX_COMP_PCODE
      when 'COMP_PHONE'    then FAX_COMP_PHONE
      when 'COVERPAGE'     then FAX_COVERPAGE
      when 'FROM'          then FAX_FROM
      when 'NEWDOC'        then FAX_NEWDOC
      when 'NUMBER'        then FAX_NUMBER
      when 'SETTINGS_TEXT' then FAX_SETTINGS_TEXT
      when 'SUBJECT'       then FAX_SUBJECT
      when 'TO_ADDRESS'    then FAX_TO_ADDRESS
      when 'TO_CITY'       then FAX_TO_CITY
      when 'TO_COMP_NAME'  then FAX_TO_COMP_NAME
      when 'TO_COUNTRY'    then FAX_TO_COUNTRY
      when 'TO_EMAIL'      then FAX_TO_EMAIL
      when 'TO_FAX'        then FAX_TO_FAX
      when 'TO_FNAME'      then FAX_TO_FNAME
      when 'TO_PCODE'      then FAX_TO_PCODE
      when 'TO_PHONE'      then FAX_TO_PHONE
      when 'TO_SALUTE'     then FAX_TO_SALUTE
      when 'TO_STATE'      then FAX_TO_STATE
      when 'TO_SURNAME'    then FAX_TO_SURNAME
      when 'TO_TITLE'      then FAX_TO_TITLE
      when 'USER_EMAIL'    then FAX_USER_EMAIL
      when 'USER_FAX'      then FAX_USER_FAX
      when 'USER_NAME'     then FAX_USER_NAME
      when 'USER_PHONE'    then FAX_USER_PHONE
      when 'USER_TITLE'    then FAX_USER_TITLE
      else
         '<Unknown>'
   end as FaxLanguageLabel
,  convert(nvarchar,SFT_TEMPLATE1)
,  convert(nvarchar,SFT_TEMPLATE2)
from
   SYS_FAX_SOFTWARE
      left outer join SYS_FAX_TEMPLATE on SFT_SFS_LINK=SFS_PRIMARY
      left outer join SYS_FAX_LABELS   on SFL_PRIMARY=SFT_SFL_LINK
,  LANG_DEF17
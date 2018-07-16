CREATE VIEW AA_REP_STK_FIFO_SERIAL_VIEW
/*
**
** Written:      29/10/2010 NC
** Last Amended:
*/
as
Select
     SNOL_MOVEMENT_LINK as MovementPrimary
   , count(SNO_PRIMARY) as SerialCountInStock

   from STK_SERIAL_NUMBERS with (nolock)
      join STK_SERIAL_LINK with (nolock) on SNOL_SERIAL_LINK = SNO_PRIMARY
   where
      case when SNO_STATUS='O' and SNO_BATCH_FLAG>=1
           then 'I'
           when SNO_STATUS='I' and SNO_BATCH_FLAG=0
           then 'I'
           else 'O'
      end
      =
      'I'
  group by SNOL_MOVEMENT_LINK
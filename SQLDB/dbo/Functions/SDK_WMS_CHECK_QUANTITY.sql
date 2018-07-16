
CREATE FUNCTION dbo.SDK_WMS_CHECK_QUANTITY 
(
@StkPrimary float,
@ItemQuantity float,
@PackQuantity float,
@InnerQuantity float,
@OuterQuantity float
)
RETURNS float
AS
BEGIN
declare @ItemPriceLine int,
		@PackPriceLine int,
		@InnerPriceLine int,
		@OuterPriceLine int,
		@PackActive tinyint,
		@InnerActive tinyint,
		@OuterActive tinyint,
		@ItemUnits float,
		@PackUnits float,
		@InnerUnits float,
		@OuterUnits float
		
declare @local_quantity float
set @local_quantity=0
		
Select @ItemPriceLine=DELT_ITEM_PRICELINE,
		@PackPriceLine=DELT_PACK_PRICELINE,
		@InnerPriceLine=DELT_INNER_PRICELINE,
		@OuterPriceLine=DELT_OUTER_PRICELINE,
		@PackActive=DELT_PACK_ACTIVE,
		@InnerActive=DELT_INNER_ACTIVE,
		@OuterActive=DELT_OUTER_ACTIVE from SDK_WMS_TEMPLATE
		join SDK_WMS_TEMPLATE_ASSIGN on WMSS_DELT_PRIMARY=DELT_PRIMARY
		where WMSS_STK_PRIMARY=@StkPrimary
		
Select 
@ItemUnits=1,
@PackUnits=CASE 
	WHEN @PackPriceLine=1 THEN STK_SELL_UNIT1
	WHEN @PackPriceLine=2 THEN STK_SELL_UNIT2
	WHEN @PackPriceLine=3 THEN STK_SELL_UNIT3
	WHEN @PackPriceLine=4 THEN STK_SELL_UNIT4
	WHEN @PackPriceLine=5 THEN STK_SELL_UNIT5
	WHEN @PackPriceLine=6 THEN STK_SELL_UNIT6
	WHEN @PackPriceLine=7 THEN STK_SELL_UNIT7
	WHEN @PackPriceLine=8 THEN STK_SELL_UNIT8
	WHEN @PackPriceLine=9 THEN STK_SELL_UNIT9
	WHEN @PackPriceLine=10 THEN STK_SELL_UNIT10 ELSE 0 END,	
@InnerUnits=CASE 
	WHEN @InnerPriceLine=1 THEN STK_SELL_UNIT1
	WHEN @InnerPriceLine=2 THEN STK_SELL_UNIT2
	WHEN @InnerPriceLine=3 THEN STK_SELL_UNIT3
	WHEN @InnerPriceLine=4 THEN STK_SELL_UNIT4
	WHEN @InnerPriceLine=5 THEN STK_SELL_UNIT5
	WHEN @InnerPriceLine=6 THEN STK_SELL_UNIT6
	WHEN @InnerPriceLine=7 THEN STK_SELL_UNIT7
	WHEN @InnerPriceLine=8 THEN STK_SELL_UNIT8
	WHEN @InnerPriceLine=9 THEN STK_SELL_UNIT9
	WHEN @InnerPriceLine=10 THEN STK_SELL_UNIT10 ELSE 0 END,
@OuterUnits=CASE 
	WHEN @OuterPriceLine=1 THEN STK_SELL_UNIT1
	WHEN @OuterPriceLine=2 THEN STK_SELL_UNIT2
	WHEN @OuterPriceLine=3 THEN STK_SELL_UNIT3
	WHEN @OuterPriceLine=4 THEN STK_SELL_UNIT4
	WHEN @OuterPriceLine=5 THEN STK_SELL_UNIT5
	WHEN @OuterPriceLine=6 THEN STK_SELL_UNIT6
	WHEN @OuterPriceLine=7 THEN STK_SELL_UNIT7
	WHEN @OuterPriceLine=8 THEN STK_SELL_UNIT8
	WHEN @OuterPriceLine=9 THEN STK_SELL_UNIT9
	WHEN @OuterPriceLine=10 THEN STK_SELL_UNIT10 ELSE 0 END
	
 from STK_STOCK_2 join STK_STOCK on STKCODE=STKCODE2 Where STK_PRIMARY=@StkPrimary

if (@OuterQuantity<>0 and @OuterActive=1) set @local_quantity=@local_quantity + (@OuterQuantity*@OuterUnits)
if (@InnerQuantity<>0 and @InnerActive=1) set @local_quantity=@local_quantity + (@InnerQuantity*@InnerUnits)
if (@PackQuantity<>0 and @PackActive=1) set @local_quantity=@local_quantity + (@PackQuantity*@PackUnits)
set @local_quantity=@local_quantity + (@ItemQuantity*@ItemUnits)

return @local_quantity
END

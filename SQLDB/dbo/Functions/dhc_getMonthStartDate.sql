
create function dhc_getMonthStartDate
(
	@date as datetime,
	@monthOffset as int = 0
) returns datetime
begin

	set @date=dateadd(month,@monthOffset,@date)

	return convert(datetime,'1/'+cast(month(@date) as varchar(2))+'/'+cast(year(@date) as varchar(4)),103)

end

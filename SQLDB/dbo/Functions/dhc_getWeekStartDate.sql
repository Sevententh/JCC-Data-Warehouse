

create function dhc_getWeekStartDate
(
	@date as datetime,
	@weekOffset as int = 0
) returns datetime
begin
	--selects the start of the last full week (MONDAY)

	set @date=dateadd(day,@weekOffset*7,@date)

	--datepart(weekday,date)
	-- 1=Sunday,2=Monday,3=Tuesday,4=Wednesday,5=Thursday,6=Friday,7=Saturday

	set @date = dateadd(day,-1*(case datepart(weekday,@date) when 1 then 6 when 2 then 7 else (datepart(weekday,@date)-2)+7 end),@date)

	return convert(datetime,cast(day(@date) as varchar(2))+'/'+cast(month(@date) as varchar(2))+'/'+cast(year(@date) as varchar(4)),103)

end

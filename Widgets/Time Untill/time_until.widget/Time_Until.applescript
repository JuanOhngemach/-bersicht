on run (argument)
	set theDate to date (item 1 of argument)
	set {year:y, month:m, day:d, time:s} to theDate
	set {year:cy, month:cm, day:cd, time:cs} to current date
	
	set aYear to y - cy
	set aMonth to m - cm
	set aDay to d - cd
	set aHour to (s div 3600) - (cs div 3600)
	set aMinute to (s div 60) - (cs div 60) - (aHour * 60) -1
	set aSec to (s - cs) - (aHour * 3600) - (aMinute * 60)
	
	if aSec is less than 0 then
		set aSec to aSec + 60
		set aMiute to aMinute - 1
	end if
	
	if aMinute is less than 0 then
		set aMinute to aMinute + 60
		set aHour to aHour - 1
	end if
	
	if aHour is less than 0 then
		set aHour to aHour + 24
		set aDay to aDay - 1
	end if
	
	if aDay is less than 0 then
		set aDay to aDay + daysinmonth(theDate)
		set aMonth to aMonth - 1
	end if
	
	if aMonth is less than 0 then
		set aMonth to aMonth + 12
		set aYear to aYear - 1
	end if
	
	return aYear & checkPlural(aYear, "year") & aMonth & checkPlural(aMonth, "month") & aDay & checkPlural(aDay, "day") & aHour & checkPlural(aHour, "hour") & aMinute & checkPlural(aMinute, "minute") & aSec & checkPlural(aSec, "second") as string
end run

on daysinmonth(theDate)
	copy theDate to d
	set d's day to 32
	return (d - (d's day) * days)'s day
end daysinmonth

on checkPlural(aValue, label)
	if aValue = 1 then
		return " " & label & " "
	else
		set label to " " & label & "s "
	end if
end checkPlural
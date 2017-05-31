m = {'January' => 31, 'February' => 28,
	'March' => 31, 'April' => 30, 'May' => 31,
	'June' => 30, 'July' => 31, 'August' => 31, 
	'September' => 30, 'October' => 31, 
	'November' => 30, 'December' => 31}

m.each do |z, x|
	puts "there are #{x} days in #{z}" if x == 30
end
# Исправил !  просто читабельность того что ниже усваивается проще для меня (т е  строка выше требует больше времяни на понимание)
#  да я осазнаю что это лишние байты которые потом превратятся в мб если так продолжу     буду исправляться


#m.each do |z,x|
#	if x == 30
#	puts "there are #{x} days in #{z}"
#end
#end

puts "enter a"
a = gets.to_f

puts "enter b"
b = gets.to_f

puts "enter c"
c = gets.to_f

d = b**2 - (4 * a * c)

if d < 0
	puts "нет корней"
elsif d == 0
	x = (-b +  Math.sqrt(d)) / (2 * a)
	puts "дискриминант = 0, корень = #{x}" #что то запутался что надо и не надо..
		 # ТЗ Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
		 #Если d = 0, смысла нет считать квадратный корень из него (psylone 14 hours ago)
else d > 0 
	x1 = (-b +  Math.sqrt(d)) / (2 * a)
	x2 = (-b -  Math.sqrt(d)) / (2 * a)
puts "x1= #{x1}, x2= #{x2}"
end
		
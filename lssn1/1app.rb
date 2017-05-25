puts "Введи имя свое"
name = gets.chomp.capitalize

puts "Приветствую #{name} !\nТеперь введи свой вес"
m8_w= gets.to_i


result = m8_w - 110
#puts "#{result} = ur result #{name}"

if result < 0
	puts "Дорогой, #{name}  мы изучили тебя! Твой вес в идеален! "
else 
	puts "Дорогой, #{name} !  показатель твоего веса равен: #{result} " # добавил вывод имени 
end

#    5. Заданы три числа, которые обозначают число, месяц, год 
#   (запрашиваем у пользователя). Найти порядковый номер даты, начиная 
#   отсчет с начала года. Учесть, что год может быть високосным.
#   (Запрещено использовать встроенные в ruby методы 
#   для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru

=begin
	
Алгоритмы определения високосного года

Високосный год вычисляется с помощью простого алгоритма. 
К сожалению, существуют системы и приложения, которые не
 определяют 2000 г. как високосный, и при использовании 
 этих систем даты после 29 февраля 2000 г. могут оказаться ошибочно
  сдвинуты на один день. Високосный год определяется по следующему правилу:

Год високосный, если он делится на четыре без остатка, 
но если он делится на 100 без остатка, это не високосный год. 
Однако, если он делится без остатка на 400, это високосный год. 
Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
	
=end

puts "введи день рождения"
day = gets.to_i
puts "введи месяц рождения"
mounth = gets.to_i - 1   
puts "введи год рождения"
year = gets.to_i
mounthdays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
a = 0

if year % 4 && year % 100 || year % 400
	month[1] = 29
end
mounth_days = month_days[mounth]
# тут проблема 
# выше определил что mounth_days = цифре(месяцу) что введет чел 
# но не доходит как осуществить сложение последовательности месяцев до нужного 
# 
puts a
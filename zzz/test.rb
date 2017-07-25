=begin
Задание:

READY - - - - Разбить программу на отдельные классы (каждый класс в отдельном файле)

Разделить поезда на два типа PassangerTrain и CargoTrain, сделать родителя для классов, 
	который будет содержать общие методы и свойства

Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. 
	В комментарии к методу обосновать, почему он был вынесен в private/protected

Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). 
	К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые.

Усложненное задание: создать программу в файле main.rb, которая будет позволять 
	пользователю через текстовый интерфейс делать следующее:
Создавать станции
Создавать поезда
Добавлять вагоны к поезду
Отцеплять вагоны от поезда
Помещать поезда на станцию
Просматривать список станций и список поездов на станции
	
=end
require_relative "station.rb"
require_relative "route.rb"
require_relative "train.rb"

moscow = Station.new 'moscow'
minsk = Station.new 'minsk'
piter = Station.new 'piter'
visaginas = Station.new 'visaginas'
turmantas = Station.new 'turmantas'
ignalina = Station.new 'ignalina'
vilnius = Station.new 'vilnius'

train666 = Train.new(666, "pass")      		# создан поезд
route111 = Route.new(moscow, visaginas)    	# создан маршрут (2 станции)

route111.show_all_stations					# вывод станций в нашем маршруте
route111.add_way_station(vilnius)			# к созданному ранее маршруту добавили промежуточную ст.
route111.show_all_stations					# вывод станций в нашем маршруте
route111.add_way_station(turmantas)			# к созданному ранее маршруту добавили промежуточную ст.
route111.show_all_stations					# вывод станций в нашем маршруте
route111.del_way_station(turmantas)			# удаляю промеж ст
route111.show_all_stations					# вывод станций в нашем маршруте

train666.set_route(route111)
train666.put_train_on_route
train666.show_stations 					# now is...
route111.show_all_stations					# 1- moscow 2 - vilnius 3 - visaginas
train666.go_to_next_station
train666.show_stations 					# now is...

puts train666.speed
train666.speed_up
puts train666.speed
train666.speed_stop
puts train666.speed
train666.speed_up
puts train666.speed

puts train666.wagons_quantity
train666.add_wagon
train666.speed_stop
train666.add_wagon
train666.add_wagon
train666.add_wagon
puts train666.wagons_quantity
train666.del_wagon
puts train666.wagons_quantity
train666.speed_up
puts train666.wagons_quantity  # ну пока все норм (вагон не отцеплен) и все вышеприведенные метода пошли нормально







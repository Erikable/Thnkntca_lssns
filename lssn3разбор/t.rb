
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
puts
route111.add_way_station(vilnius)			# к созданному ранее маршруту добавили промежуточную ст.

route111.show_all_stations					# вывод станций в нашем маршруте
puts
route111.add_way_station(turmantas)			# к созданному ранее маршруту добавили промежуточную ст.
route111.show_all_stations					# вывод станций в нашем маршруте
route111.del_way_station(turmantas)			# удаляю промеж ст
route111.show_all_stations					# вывод станций в нашем маршруте
puts
train666.set_route(route111)
train666.put_train_on_route
train666.show_stations 					# now is...

route111.show_all_stations					# 1- moscow 2 - vilnius 3 - visaginas

train666.go_to_next_station
train666.show_stations 					# now is...

puts train666.speed                    # 0

train666.speed_up
puts train666.speed 					# 13

train666.speed_stop
puts train666.speed 					# 0

train666.speed_up
puts train666.speed 					# 13

puts train666.wagons_quantity 			# 0

train666.add_wagon 						#Не смог прибавить вагон

train666.speed_stop 					# скорость сброшена

train666.add_wagon 						#вагон прибавлен
train666.add_wagon 						#вагон прибавлен
train666.add_wagon 						#вагон прибавлен

puts train666.wagons_quantity 			# 3
train666.del_wagon 						#вагон отцеплен
puts train666.wagons_quantity 			# 2
train666.speed_up 						#скорость поднята
puts train666.wagons_quantity  			# 2

vilnius.all_trains    					# 666 находится на станции Вилинюс

vilnius.show_trains_type("pass")

train666.go_to_next_station
train666.show_stations 
puts
train666.go_to_last_station
train666.show_stations 
puts
train666.go_to_last_station
train666.show_stations 
puts
train666.go_to_last_station
train666.show_stations 







require_relative "station.rb"
require_relative "route.rb"

require_relative "train.rb"
require_relative "passanger_train"
require_relative "cargo_train"

require_relative "wagon.rb"
require_relative "cargo_wagon"
require_relative "passanger_wagon"


moscow = Station.new 'moscow'
minsk = Station.new 'minsk'
piter = Station.new 'piter'
visaginas = Station.new 'visaginas'
turmantas = Station.new 'turmantas'
ignalina = Station.new 'ignalina'
vilnius = Station.new 'vilnius'

#
passanger_train_1 = PassangerTrain.new(111) 
passanger_train_2 = PassangerTrain.new(22)     		
cargo_train_3 = CargoTrain.new(30)
cargo_train_4 = CargoTrain.new(44)

#
pw1 = PassangerWagon.new
pw2 = PassangerWagon.new
pw3 = PassangerWagon.new
cw1 = CargoWagon.new
cw2 = CargoWagon.new
cw3 = CargoWagon.new

#
route_1 = Route.new(moscow, visaginas)    	
route_2 = Route.new(moscow, piter)
route_3 = Route.new(turmantas, moscow)


route_1.show_all_stations					# вывод станций в нашем маршруте
puts "_____________"
route_2.show_all_stations					# вывод станций в нашем маршруте
puts "_____________"
route_3.show_all_stations					# вывод станций в нашем маршруте
puts "_____________"

route_1.add_way_station(vilnius)			# к созданному ранее маршруту добавили промежуточную ст.

route_1.show_all_stations					# вывод станций в нашем маршруте
puts
route_1.add_way_station(turmantas)			# к созданному ранее маршруту добавили промежуточную ст.
route_1.show_all_stations					# вывод станций в нашем маршруте
route_1.del_way_station(turmantas)			# удаляю промеж ст
route_1.show_all_stations					# вывод станций в нашем маршруте
puts
passanger_train_1.set_route(route_1)
#passanger_train_1.put_train_on_route
passanger_train_1.show_stations 					# now is...

route_1.show_all_stations					# 1- moscow 2 - vilnius 3 - visaginas

passanger_train_1.go_to_next_station
passanger_train_1.show_stations 					# now is...

puts passanger_train_1.speed                    # 0

passanger_train_1.speed_up
puts passanger_train_1.speed 					# 13

passanger_train_1.speed_stop
puts passanger_train_1.speed 					# 0

passanger_train_1.speed_up
puts passanger_train_1.speed 					# 13

puts passanger_train_1.wagons_quantity 			# 0

passanger_train_1.add_wagon(pw1)						#Не смог прибавить вагон

passanger_train_1.speed_stop 					# скорость сброшена

passanger_train_1.add_wagon(pw1) 						#вагон прибавлен
passanger_train_1.add_wagon(pw2)						#вагон прибавлен
passanger_train_1.add_wagon(cw3)						#wrong type
#puts passanger_train_1.wagons_quantity 			# 3
puts " Вагонов в поезде #{passanger_train_1.wagons_quantity}"   # Вагонов в поезде 2

passanger_train_1.del_wagon(pw2) 						#вагон (#<PassangerWagon:0x007f804d22d1c8>) отцеплен
puts passanger_train_1.wagons_quantity			# 2
passanger_train_1.speed_up 						#скорость поднята
puts passanger_train_1.wagons_quantity  			# 2

vilnius.all_trains    					# 111

vilnius.show_trains_type("pass")

passanger_train_1.go_to_next_station
passanger_train_1.show_stations 
puts
passanger_train_1.go_to_last_station
passanger_train_1.show_stations 
puts
passanger_train_1.go_to_last_station
passanger_train_1.show_stations 
puts
passanger_train_1.go_to_last_station
passanger_train_1.show_stations 
puts "___T_H_E___E_N_D___"

vilnius.take_train(passanger_train_2)
vilnius.take_train(cargo_train_3)
vilnius.take_train(cargo_train_4)
vilnius.show_trains_type(:cargo)


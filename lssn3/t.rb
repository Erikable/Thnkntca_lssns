require_relative "2"

#aaa = Station.new(Leningradsky_vokzal)

#aaa.add_train
		#show_all_trains_on_station
		#show_all_trains_by_type

ttt = Train.new(666, "pass", 6)

puts ttt.speed
ttt.speed_up
puts ttt.speed
ttt.speed_stop
puts ttt.speed
ttt.speed_up
ttt.speed_up
ttt.speed_up
puts ttt.speed
ttt.speed_stop
puts ttt.speed
puts ttt.show_quantity_of_wagons
ttt.speed_up
ttt.add_wagon
puts ttt.show_quantity_of_wagons
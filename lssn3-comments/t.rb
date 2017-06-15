require_relative "1"



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
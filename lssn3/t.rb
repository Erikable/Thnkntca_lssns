require_relative "1"

vokzal = Station.new("Airport")
route1 = Route.new("Msc", "Vln")
train1 = Train.new(111, "passanger", 6)

vokzal.take_a_train(train1)

p vokzal
p train1
p route1

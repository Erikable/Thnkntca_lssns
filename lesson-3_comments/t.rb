


=begin
require_relative "1"

moscow = Station.new 'moscow'
minsk = Station.new 'minsk'
vilnius = Station.new 'vilnius'
visaginas = Station.new 'visaginas'
piter = Station.new 'piter'

train666 = Train.new(666, "pass")

route111 = Route.new(%w(moscow minsk vilnius visaginas))
route222 = Route.new(%w(visaginas piter))

train666.set_route train#route

moscow.send_a_train train666
=end
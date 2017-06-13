=begin
				Класс Station (Станция):
				Имеет название, которое указывается при ее создании
				Может принимать поезда (по одному за раз)
				Может возвращать список всех поездов на станции, находящиеся в текущий момент
				Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
				Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end
																						class Station
																							
																							attr_reader :station_name, :train_type
																							#attr_writer 

																							def initialize(station_name)
																								@station_name = station_name
																								@trains = []
																							end
																							def add_train(train)
																								@trains.push(train)
																							end
																							def show_all_trains_on_station
																								@trains.each {|t| puts t}
																							end
																							def show_all_trains_by_type(train)
																								@trains.each {|t| pust t.train_type} #__.find_all.....
																							end
																							def send_train(train)
																								@trains.pop(train)
																							end

																						end


=begin
																										Класс Route 
				Имеет начальную и конечную станцию, а также список промежуточных станций. 
				Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
				Может добавлять промежуточную станцию в список
				Может удалять промежуточную станцию из списка
				Может выводить список всех станций по-порядку от начальной до конечной
=end
																						class Route

																							attr_reader :route

																							def initialize(start_station, end_station)
																								@route = [start_station, end_station]
																							end
																							def add_way_station(station)
																								@route.insert(-2, station)
																							end
																							def del_way_station(station)
																								@route.delete_at(-2)
																							end
																							def show_all_stations
																								@route.each {|stat| puts stat}
																							end
																						end

=begin
				Класс Train (Поезд):
				Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, 
																				эти данные указываются при создании экземпляра класса
				Может набирать скорость
				Может возвращать текущую скорость
				Может тормозить (сбрасывать скорость до нуля)
				Может возвращать количество вагонов
				Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает 
								или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
				Может принимать маршрут следования (объект класса Route). 
			При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
	Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
	Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end
class Train

	attr_reader :speed, :train_number, :train_type, :wagons_quantity, :current_route, :current_station, :pass
	attr_writer :pass
	def initialize(train_number, train_type, wagons_quantity)
		@train_number = train_number
		@train_type = train_type
		@wagons_quantity = wagons_quantity
		@wagons_quantity = 0
		@speed = 0
	end

	def speed_up
		@speed += 10
	end
	def show_speed
		@speed
	end

	def speed_stop
		@speed = 0
	end

	def show_quantity_of_wagons
		@wagons_quantity
	end

	def add_wagon
		if @speed == 0
			@wagons_quantity += 1
		else 
			puts "TRAIN IS GOING"
		end	
	end
	def del_wagon
		if @wagons_quantity >= 1 && @speed == 0 
			@wagons_quantity -= 1 
		end
	end

	def current_route(route) # Может принимать маршрут следования (объект класса Route)
		@current_route = route
		#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
		@current_station = @current_route.first
	end

	def go_ahead #Может перемещаться между станциями, указанными в маршруте. вперед  но только на 1 станцию за раз
		if @current_station != @current_route.last # == @end_station
			@current_station.route.add_way_station
			

		end
	end
	def go_back #Может перемещаться между станциями, указанными в маршруте. назад, но только на 1 станцию за раз
	
	end

	def show_stantions  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута	
	end

end

























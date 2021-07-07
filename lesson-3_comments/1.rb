
class Station
																							
	attr_reader :name 

	def initialize(name)
		@name = name
		@trains = []
	end
	def add_train(train)
		@trains.push(train)
	end
	def send_train(train)
		@trains.delete(train)
	end


	def show_trains(type = nil)
  	if type
    	show_trains_by_type(type)
  	else
    	show_all_trains
  	end
	end
	
	def show_trains_by_type(train)
		@trains.each {|t| pust t.type}
	end

	def show_all_trains(train)
		@trains.each {|t| puts t}
	end

end


class Route

	#attr_reader :stations#:stations<-route
	def stations
		@stations
	end

	def initialize(start_station, end_station)
		@stations = [start_station, end_station]
	end
	def add_way_station(station)
		@stations.insert(-2, station)
	end
	def del_way_station(station)
		@stations.delete_at(-2)
	end
	def show_all_stations
		@stations.each {|station| puts station}
	end
end


class Train

	attr_reader :speed, :number, :type, :wagons_quantity, :step

	def initialize(number, type)
		@number = number
		@type = type
		@speed = 0
		@step = 0
		@wagons_quantity = 0
	end

	def speed_up
		@speed += 10
	end

	def speed_stop
		@speed = 0
	end

	def show_quantity_of_wagons
		puts "#{@wagons_quantity} - вагонов"
	end

	def add_wagon
		if @speed == 0
			@wagons_quantity += 1
		else 
			puts "TRAIN IS GOING"
		end	
	end
	def del_wagon
		if @wagons_quantity.zero?
			pust "вагонов на отцепку нет"
		elsif @speed.zero?
			@wagons_quantity -= 1 
			puts "вагон отцеплен"
		else
			"остановись и отстегни)"
		end
	end

	def set_route(route)
		@current_route = stations # это маршрут следования (станции массива)
	end


	def next_station
		if @current_station == @current_route.last # можно с @end_station это написать было ? 
			puts "Sorry Last station"
		elsif
			@step = @current_route.index(current_station)   
			@current_station = current_route[step + 1]		
		end 
	end
	def last_station
		# ст маршрута - 1 
	end

	def show_stations # Вывод на дисплей Прошлой Наст и Буд станции
		#puts " last st = #{},\n #{current_station} is now,\n next will be = #{}"
	end

	def current_station  
		#@current_station = @current_route.first
		# не погу определить
		# по идеи это станция из текущего маршрута(@current_route) с отображением индекса массива 
	end

end






=begin
class Train

	attr_reader :speed, :number, :type, :wagons_quantity, :current_route, :current_station#, :pass 
	#:train_number to number / :train_type to type
	#attr_writer :pass
	def initialize(number, type)#, wagons_quantity)
		@number = number
		@type = type
		#@wagons_quantity = wagons_quantity
		#@wagons_quantity = 0
		@speed = 0
	end

	def show_quantity_of_wagons
		@wagons_quantity
	end



	def set_route(route) # Может принимать маршрут следования (объект класса Route)
		@current_route = stations
		#При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
		@current_station = @current_route.first
	end

	def go_ahead #Может перемещаться между станциями, указанными в маршруте. вперед  но только на 1 станцию за раз
		if @current_station == @current_route.last # @end_station 
			puts "Sorry Last station"
		elsif
			@step = @current_route.index(current_station)   
			@current_station = current_route[step + 1]		
		end
	end
	def go_back #Может перемещаться между станциями, указанными в маршруте. назад, но только на 1 станцию за раз
		if @current_station == @current_route.first
			puts "Sorry ! It's start station"
			else
				@step = @current_route.index(current_station)  #   -  можно же не писать это ведь Степ уже определен выше??
				@current_station = current_route[step - 1]
	end

	def show_stantions  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута	
		puts " last st = #{},\n #{current_station} is now,\n next will be = #{}" 
	end

	def last_station
		@last_station = @route.stations[]	
	end
	def next_station

	end

end
=end






















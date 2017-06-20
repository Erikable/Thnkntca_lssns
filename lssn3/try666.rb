class Station
																							
	attr_accessor :name, :trains

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
	
	def show_trains_by_type(type)
		@trains.each {|t| pust t.type == type}  # !!  можно иначе? 
	end

	def show_all_trains
		@trains.each {|t| puts t}
	end

end


class Route

	attr_reader :stations
	

	def initialize(start_station, end_station)
		@stations = [start_station, end_station]
	end

	def add_way_station(station)
		@stations.insert(-2, station)
	end

	def del_way_station(station)  #удал не по конкретоной позиц а именно тот обект что был передан в аргументе delete используй
		@stations.delete(station)
	end

	def show_all_stations
		@stations.each_with_index {|station, index| puts " #{index + 1} - #{station.name}"}
	end
end

class Train

	attr_reader :speed, :wagons_quantity, :type, :number, :current_station
	attr_writer :speed, :route
	
	def initialize(number, type)
			@number = number
			@type = type
			@speed = 0
			@wagons_quantity = 0

		def speed_up
		@speed += 10
	end

	def speed_stop
		@speed = 0
	end

	def show_quantity_of_wagons
		puts "#{@wagons_quantity} - вагонов"
	end

	def train_type(type = nil)
		if type  # == pass || gruz
			#вывод по типу
		else
			#показ всех поездов
			puts 
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

		def set_route(route) # принимать маршрут следования (обект класса Роуте)
			@current_route = route  #в этой переменной сидит маршрут (пример: Мск СпБ Всг)
		end
	
		def current_station
			#@current_station = @current_route +  что то что определит эту станцию
		end

	end
	
	
	# вывод поездов по типу
	
	# помещение поезда на первую станцию в маршруте При назначении маршрута поезду
	# вывод станций (прош  наст  буд)
	# прош ст
	def next_st
		
	end
	# наст ст
	# буд ст

end
























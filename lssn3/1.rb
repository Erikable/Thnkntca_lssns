=begin
Класс Station (Станция):
			-Имеет название, которое указывается при ее создании
			-Может принимать поезда (по одному за раз)
			-Может возвращать список всех поездов на станции, находящиеся в текущий момент
			-Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
			-Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end
class Station
	attr_reader :station_name

	def initialize(station_name)
		@station_name = station_name
		@trains = []
	end
	
	def take_a_train(train)
		@trains < train
	end

	def show_all_trains
		@trains.each {|train| puts train }
	end
	
	def show_trains_by_type
		@trains.find_all {|train| train.type_of_train}
	end
	
	def send_train(train)
		@trains.delete(train)
	end
end

=begin
Класс Route (Маршрут):
-Имеет начальную и конечную станцию, а также список промежуточных станций. 
				Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
			-Может добавлять промежуточную станцию в список
			-Может удалять промежуточную станцию из списка
			-Может выводить список всех станций по-порядку от начальной до конечной
=end
class Route
	attr_reader :route 
	def initialize(start_stantion, end_stantion)
		@route = [start_stantion, end_stantion]
	end

	def add_way_station_to_list(station)
		@route.insert(-2, station)
		# можно инсертом добавить станцию Но имеет ли значение в какое место? до полюбому имеет
		#просто если добавить 2 станции то как понять какая первая в маршруте?
		#в итоге между основными станциями пихнул. просто как вытащить потом эту середину..
	end

	def del_way_station_from_list(station)
		@route.delete(station)
	end

	def display_list_of_all_stations
		@route.each {|station| puts station}
	end
end

=begin
Класс Train (Поезд):
-Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, 
	эти данные указываются при создании экземпляра класса
			-Может набирать скорость
			-Может возвращать текущую скорость
			-Может тормозить (сбрасывать скорость до нуля)
			-Может возвращать количество вагонов
			-Может прицеплять/отцеплять вагоны (по одному вагону за операцию, 
				метод просто увеличивает или уменьшает количество вагонов). 
				Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
-Может принимать маршрут следования (объект класса Route). 
-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
-Может перемещаться между станциями, указанными в маршруте. 
	Перемещение возможно вперед и назад, но только на 1 станцию за раз.
-Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end
class Train

	attr_accessor :wagons, :speed


	def initialize(train_number, type_of_train, wagons)
		@wagons = 0
		@speed = 0
	end
	def speed_up
		@speed += 10
	end

	def current_speed
		@speed 
	end

	def stop_speed_to_zero
		@speed = 0
	end

	def display_num_of_wagons
		@wagons
	end

	def add_wagon
		if @speed == 0
			@wagons += 1
		else
			puts "поезд в пути- не пирстягнуть вагон!"
		end
	end
	def del_wagon
		if @speed == 0 && @wagons >= 1
			@wagons -= 1
		else
			puts "поезд  в пути - не отцепить ! или нет вагоно (ДОДЕЛАТЬ)"
		end	
	end

	def marshrut
		
	end

	def current_station
		
	end

	def move_to_station
		
	end

	def move_to_previous_station
		
	end
	def show_lcn_stations #LAST CURRTEN NEXT
		
	end


end
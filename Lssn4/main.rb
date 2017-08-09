#опять табуляциями понаделал (( Пытаюсь исправиться но так и манит таб нажать
require_relative "station.rb"
require_relative "route.rb"
require_relative "train.rb"
require_relative "passanger_train"
require_relative "cargo_train"
require_relative "wagon.rb"
require_relative "cargo_wagon"
require_relative "passanger_wagon"

# пульт управления 

class Pult
	attr_reader :trains, :stations, :routes
	def initialize
		@trains = []
		@stations = []
		@routes = []
	end

	#Создавать станции
	def create_stantion
		puts "ВВедите название станции:"
		title = gets.chomp.capitalize
		station_title = Station.new(title)
		@stations.push(station_title)
	end

#Создавать поезда
	def create_train
		puts "введи номер поезда:"
		number = gets.to_i
		puts "Выберите его тип:"
		puts "1 - Пассажирский     2 - Грузовой"
		type = gets.to_i
		if type == 1
			train = PassangerTrain.new(number)
			@trains.push(train)
		elsif type == 2
			train = CargoTrain.new(number)
			@trains.push(train)
		else
			puts "видимо ошибся во вводе"
			puts "попробуй заного"
			return create_train	
		end
	end




#Создавать маршруты и управлять станциями в нем (добавлять, удалять)
		# 1- назначить маршрут    |2- создать маршрут|     |3- доб станц|   |4- удал станц|

# создать маршрут
	def create_route
		puts "Создание маршрута!\nВедите станцию отправления:"
		start_stantion = gets.chomp.capitalize
		puts "Введите станцию назначения"
		end_station = gets.chomp.capitalize
		route = Route.new(start_stantion, end_station)
		@routes.push(route)
	end
 	# add station to route Промежуточная
 	def add_station_to_route
 		route = choose_route
 		puts "введите название промежуточной станции:"
 		station = gets.chomp.capitalize
 		route.add_way_station(station)
 	end
 	
 	# del station from route
 	def del_station_from_route
 		route = choose_route
 		puts "какую станцию удаляем?"
 		station = gets.chomp.capitalize
 		route.del_way_station(station)
 	end
	# назначение маршрута
 	def  appoint_route
 		puts "Выберите поезд"
 		choose_train
 		puts "Выберите маршрут"
 		choose_route
 	end










#Добавлять вагоны к поезду
	def add_wagon_to_train
		train = choose_train
		puts "выберите тип вагона:"
		puts "1 - Пассажирский     2 - Грузовой"
		type = gets.to_i
		if type == 1
			wagon = PassangerWagon.new
			train.add_wagon(wagon)
	      	puts "вагон прицеплен"
		elsif type == 2
      		wagon = CargoWagon.new
      		train.add_wagon(wagon)
      		puts "вагон прицеплен"
      	else puts "error"
      	end
      	#train.add_wagon(wagon)  или одну строку сюда
	end

#Отцеплять вагоны от поезда
	def del_wagon_from_train
		train = choose_train
		wagon = choose_wagon(train)
		train.del_wagon(wagon)
		puts "вагон отцеплен"
	end

#Перемещать поезд по маршруту вперед и назад
	def move_train_forvard
		train = choose_train
		train.go_to_next_station
	end

	def move_train_back
		train = choose_train
		train.go_to_last_station
	end


#Просматривать список станций и список поездов на станции
	def list_of_stantions
		puts "просмотр всех имеющихся станций"
		@stations.each_with_index {|station, i| puts "#{i + 1} - #{station.name}"}
	end
	def list_of_trains
		puts "выберите номер нужной станции:"
		@stations.each_with_index {|st, i| puts "#{i + 1} - #{st.name}"}
		station = gets.to_i
		current_station = @stations[station - 1]
		puts "поезда на станции #{current_station.name} :"
		current_station.all_trains#(station)
		#@trains.each_with_index {|train, i| puts "#{i + 1} - #{train}" }
	end
# game controller
	def start_game
		puts "список команд с номерами"
		puts "1-создать станцию\n
		2-создать поезд\n
		3-создатьмаршрут(1 и последняя станции)\n
		4-вывод списка станций\n
		5-назначить маршрут\n"

		loop do
			puts "введите номер комадны"
			command = gets.to_i
			case command
				when 1
					create_stantion
				when 2
					create_train
				when 3
					create_route
				when 4
					list_of_stantions
				when 5
					list_of_trains
				when 6 
					
				when 7
							
				when 8
				when 
				when 
				when 
				when 
							
				else
					puts "что то не так ввел"
						
			end		
		end
	end

# _______________
	private # приват не протектед тк наследников не будет у классса (инкапсуляция)
	
	# конкретный поезд
	def choose_train
		puts "выберите порядковый номер нужного поезда"
		trains.each_with_index {|train, index| puts " #{index + 1} - #{train}"}
		index_of_tarain = gets.to_i
		trains[index_of_train - 1] 
	end

	def choose_wagon(train)
		puts "выберите вагон"
		trains.wagons.each_with_index {|wag, index| puts "Вагон (#{wag})  номер #{index + 1}"}
		index_of_wagon = gets.to_i
		train.wagons[index_of_wagon - 1]
	end

	def choose_route
		puts "выберите маршрут из списка"
		@routes.each_with_index {|route, index| puts "#{index + 1} - #{route}"}
		index_of_route = gets.to_i
		routes[index_of_route - 1]
	end







end
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
	#attr_writer :stations
	def initialize
		@trains = []
		@stations = []
		@routes = []
	end

														#1    Создавать станции
	def create_stantion
		puts "ВВедите название станции:"
		title = gets.chomp.capitalize
		station_title = Station.new(title)
		@stations.push(station_title)
	end

														#2   Создавать поезда
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


															#3 создать маршрут 
	def create_route
		list_of_stantions
		puts "Создание маршрута!\nВедите станцию отправления:"
		start_stantion = gets.chomp.capitalize
		puts "Введите станцию назначения"
		end_station = gets.chomp.capitalize
		route = Route.new(start_stantion, end_station)
		@routes.push(route)
		puts "маршрут #{route.stations} создан"
	end
 	# add station to route Промежуточная
 															#13
 	def add_station_to_route
 		route = choose_route
 		puts "введите название промежуточной станции:"
 		station = gets.chomp.capitalize
 		route.add_way_station(station)
 	end
 	
 	# del station from route
 															#14
 	def del_station_from_route
 		route = choose_route
 		puts "какую станцию удаляем?"
 		station = gets.chomp.capitalize
 		route.del_way_station(station)
 	end
															#6  назначение маршрута
 	def  appoint_route
 		train = choose_train
 		route = choose_route
 		train.set_route(route)
 		puts "маршрут назначен "
 		train.put_train_on_route
 		puts "поезд помещен на 1ю станцию в маршруте "
 	end
															#12 показ существующих маршрутов
 	def show_ready_routes
 		@routes.each_with_index {|route, i| puts " маршрут #{i + 1}- #{route.stations}"}
 	end









#Добавлять вагоны к поезду
															#7
	def add_wagon_to_train
		train = choose_train
		puts "выберите тип вагона:"
		puts "1 - Пассажирский     2 - Грузовой"
		type = gets.to_i
		if type == 1
			wagon = PassangerWagon.new
			train.add_wagon(wagon)
	      	#puts "вагон прицеплен"
		elsif type == 2
      		wagon = CargoWagon.new
      		train.add_wagon(wagon)
      		#puts "вагон прицеплен"
      	else puts "error"
      	end
      	#train.add_wagon(wagon)  или одну строку сюда
	end

#Отцеплять вагоны от поезда
																#8
	def del_wagon_from_train
		train = choose_train
		wagon = choose_wagon(train)
		train.del_wagon(wagon)
		puts "вагон отцеплен"
	end

#Перемещать поезд по маршруту вперед и назад
																#10
	def move_train_forvard
		train = choose_train
		train.go_to_next_station
	end
																#11
	def move_train_back
		train = choose_train
		train.go_to_last_station
	end


#Просматривать список станций и список поездов на станции
																#4
	def list_of_stantions
		puts "просмотр всех имеющихся станций"
		@stations.each_with_index {|station, i| puts "#{i + 1} - #{station.name}"}
	end

																#5
	def list_of_trains
		puts "выберите номер нужной станции на которой проверим наличие поезда:"
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
		puts "1-создать станцию\n2-создать поезд\n3-создатьмаршрут(1 и последняя станции)
		\n4-вывод списка станций\n5-назначить маршрут\n"

		loop do
			puts "введите номер комадны"
			command = gets.to_i
			case command
				when 1
					create_stantion  # working
				when 2
					create_train  #done
				when 3
					create_route     #working
				when 4
					list_of_stantions  # working
				when 5
					list_of_trains  #done
				when 6 
					appoint_route
				when 7 
					add_wagon_to_train	 #done	
				when 8
					del_wagon_from_train  #done
				when 10
					move_train_forvard
				when 11 
					move_train_back
				when 11
					put_train_on_route
				when 12
					show_ready_routes	#working
				when 13
					add_station_to_route  #working
				when 14
					del_station_from_route #working
				when 0
					exit																								
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
		trains.each_with_index {|train, index| puts " #{index + 1} - #{train.number}"}
		index_of_train = gets.to_i
		trains[index_of_train - 1] 
	end

	def choose_wagon(train)
		puts "выберите вагон"
		train.wagons.each_with_index {|wag, index| puts "Вагон (#{wag})  номер #{index + 1}"}
		index_of_wagon = gets.to_i
		train.wagons[index_of_wagon - 1]
	end

	def choose_route
		puts "выберите маршрут из списка"
		if @routes.empty?
			puts "сначало зарегистрируйте маршруты"
		else
		@routes.each_with_index {|route, index| puts "#{index + 1} - #{route.stations}"} # что то не дошло как сделать вывод красивей
		index_of_route = gets.to_i
		routes[index_of_route - 1]
		end

	end







end
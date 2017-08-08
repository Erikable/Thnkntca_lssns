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
		typy = gets.to_i
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


#Назначать маршрут поезду   
	def appoint_route
		puts "Создание маршрута!\nВедите станцию отправления"
		start_stantion = gets.chomp.capitalize
		puts "Введите станцию назначения"
		end_station = gets.chomp.capitalize
		route = Route.new(start_stantion, end_station)
		@routes.push(route)
	end
 
#Добавлять вагоны к поезду
	def add_wagon_to_train
		puts "выберите тип вагона:"
		puts "1 - Пассажирский     2 - Грузовой"
		type = gets.to_i
		if type == 1
			wagon = PassangerWagon.new
			#   ЗАКОНЧИЛ ТУТ !  место продолжения...
		elsif type == 2
      		wagon = CargoWagon.new
      	else puts "error"
      	end
	end

#Отцеплять вагоны от поезда
	def del_wagon_from_train
	end

#Перемещать поезд по маршруту вперед и назад


#Просматривать список станций и список поездов на станции

# _______________
	private # приват не протектед тк наследников не будет у классса (инкапсуляция)
	
	# конкретный поезд
	def choose_train
		puts "выберите порядковый номер нужного поезда поезда"
		@trains.each_with_index {|train, index| puts " #{index + 1} - #{train}"}
		index_of_tarain = gets.to_i
		trains[index_of_tarain] 
	end











end
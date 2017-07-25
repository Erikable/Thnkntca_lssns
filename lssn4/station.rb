class Station
	attr_accessor :trains, :name

	#-Имеет название, которое указывается при ее создании
	def initialize(name)
		@name = name
		@trains = []
	end
	
	#-Может принимать поезда
	def take_train
		@trains.push(train)
	end
	
	#-Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
	def send_train
		@trains.delete(train)
	end
	
	#-Может показывать список всех поездов на станции, находящиеся в текущий момент
	def show_all_trains
		@trains.each {|train| puts train }
	end
	
	#-Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
	def show_trains_by_type(type)
		@trains.each {|train| train.type}
	end




end
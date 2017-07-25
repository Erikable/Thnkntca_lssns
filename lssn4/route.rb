class Route
	attr_accessor :stations

	#-Имеет начальную и конечную станцию, а также список промежуточных станций
	def initialize(start_station, end_statoin)
		@stations = [start_station, end_statoin] 
	end

	#-Может добавлять промежуточную станцию в список
	def add_station(station)
		@stations.insert[-2, station] 
	end

	#-Может удалять станцию из списка
	def del_stataion(station)
		@stations.delete(station)
	end

	#-Может выводить список всех станций по-порядку от начальной до конечной
	def show_all_stations
		@stations.each_with_index {|station, index| puts "#{index + 1} ---  #{station.name}"}
	end

end
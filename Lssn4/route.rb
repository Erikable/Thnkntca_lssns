class Route
  
  attr_reader :stations

  def initialize(start_station, end_station)
		@stations = [start_station, end_station]
  end

  def add_way_station(station)
    @stations.insert(-2, station)
  end

  def del_way_station(station)
    @stations.delete(station)
  end

  def show_all_stations
    @stations.each_with_index {|station, index| puts " #{index + 1} - #{station.name}"}
  end
  # тут паблик все тк всеми методами пользуемся (из экземпляра класса (rout-1 = Route.new) 
  
  private
  #attr_writer :stations 

end
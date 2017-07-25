=begin
Маршрут:
Имеет начальную и конечную станцию, а также список промежуточных станций
Может добавлять станцию в список
Может удалять станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной
=end

class Route

  attr_accessor :stations

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

end
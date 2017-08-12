class Route
  attr_accessor :stations, :route
  def initialize(start_station, end_station)
    @route = [start_station, end_station]
  end

  def add_station(station)
    @route.insert(-2, station)
  end

  def del_station(station)
    if @route.include? station
      @route.delete(station)
    else
      puts "Станции #{station} нет в маршруте!"
    end
  end

  def get_station_list
     @route.each { |e| puts e }
  end

end
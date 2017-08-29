class Route
  attr_accessor :stations, :route
  def initialize(start_station, end_station)
    @route = [start_station, end_station]
    validate!
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

  def valid?
    validate!
    true
  rescue
    false
  end

private

  def validate!
    raise "начальная и конечная не могут быть одинаковы" if route.first == route.last
    raise "не может быть nil" if route.first.nil? || route.last.nil?
    raise "не может быть empty" if route.first == "" || route.last == ""
    raise "1-пока не является станцией" unless route.first.is_a? (Station)
    raise "2-пока не является станцией" unless route.last.is_a? (Station) 
  end

end
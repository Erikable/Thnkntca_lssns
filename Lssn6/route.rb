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
    raise "Начальная и конечная станции не могут быть одинаковы" if route.first == route.last
    raise "Станция в маршруте не может быть nil" if route.first.nil? || route.last.nil?
    raise "Станция в маршруте не может быть пустой" if route.first == "" || route.last == ""
    raise "Первая станция не является станцией!" unless route.first.is_a? (Station)
    raise "Вторая станция не является станцией!" unless route.last.is_a? (Station) 
  end

end
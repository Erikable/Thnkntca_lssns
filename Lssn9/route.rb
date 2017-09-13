# frozen_string_literal: true

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

  def took_station_list
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
    raise puts 'Начальная и конечная станции не могут быть одинаковы' if route.first == route.last
    raise puts 'Первая станция не является станцией!(номер станции не соответствует существующему)' unless route.first.is_a? Station
    raise puts 'Вторая станция не является станцией!(номер станции не соответствует существующему)' unless route.last.is_a? Station
  end
end

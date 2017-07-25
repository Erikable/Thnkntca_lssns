=begin
Поезд:
      Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
Поезд может делать следующие вещи:
      набирать скорость
      показывать текущую скорость
      тормозить
      показывать количество вагонов
      прицеплять/отцеплять вагоны (по одному вагону за операцию, 
      метод просто увеличивает или уменьшает количество вагонов). 
      Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
-Может принимать маршрут следования (объект класса Route). 
-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
Перемещаться между станциями, указанными в маршруте.
Показывать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train

  attr_accessor :type, :number, :current_station, :route, :station
  attr_reader :speed, :wagons_quantity, :index

  def initialize(number, type)
	  @number = number
    @type = type
    @wagons_quantity = 0
    @speed = 0
    @index = 0
  end
  
  def speed_up
    puts "скорость поднята"
    @speed += 13
  end

  def speed_stop
    puts "скорость сброшена"
    @speed = 0
  end

  def add_wagon
    if @speed == 0 
      @wagons_quantity += 1
      puts "вагон прибавлен"
    else
      puts "Не смог прибавить вагон"
    end
  end

  def del_wagon
    if @wagons_quantity.zero?
      pust "вагонов на отцепку нет"
    elsif @speed.zero?
      @wagons_quantity -= 1 
      puts "вагон отцеплен"
    else
      "остановись и отстегни)"
    end
  end

  

  def current_station
    @current_station = @marshrut.stations[@index]
  end

  def last_station
    @last_station = @marshrut.stations[@index.pred]
  end

  def next_station
    @next_station = @marshrut.stations[@index.next] #succ аналог next
  end

  def go_to_next_station
    if @index == @marshrut.stations[-1]
      puts "поезд на последней станции!!!"
    else
      @current_station.send_train(self) 
      @current_station = next_station 
      @index += 1
      @current_station.take_train(self)
      puts "поезд прибыл на следующую станцию #{@current_station.name}"
    end
  end

  def go_to_last_station
    if @index == 0
      puts "поезд на первой станции!!!"
    else
      @current_station.send_train(self)
      @current_station = last_station
      @index -= 1
      @current_station.take_train(self)
      puts "Поезд поехал на предыдущую станцию = #{current_station.name}"
    end
  end

  def set_route(route)
   @marshrut = route
  end

  def put_train_on_route
    current_station.take_train(self) 
    #@train_on_route = @marshrut[@index]
  end

  def show_stations
    puts "now is #{current_station.name} station"
    puts "last station is #{last_station.name}" if @index > 0
    puts "next station is #{next_station.name}" if @index != -1 || 0
  end
  
end












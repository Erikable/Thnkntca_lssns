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
    @speed += 13
  end

  def speed_stop
    @speed = 0
  end

  def add_wagon
    if @speed == 0 
      @wagons_quantity += 1
    else
      puts "oblom mi edem"
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

  def show_trains_type
  #def вывод поездов по типу
  end

  def current_station
    @current_station = @marshrut.stations[@index]
  end

  def last_station
    @last_station = @marshrut.stations[@index.pred]
  end

  def next_station
    @next_station = @marshrut.stations[@index.next]
  end

  def go_to_next_station
    if @index == @marshrut.stations[-1]
      puts "поезд на последней станции!!!"
    else
      @current_station.send_train(self) # 
      @current_station = next_station # заметил что хочу сделать это от @next_station(от инстанс а не от метода) !!! так ли это? net ne tak
      @index += 1
      @current_station.take_train(self)
      puts "поезд поехал на следующую станцию #{@current_station.name}"
    end
  end

  def go_to_last_station
    if @index == 0
      puts "поезд на первой станции!!!"
    else
      @current_station.send_train
      @current_station = last_station
      @index -= 1
      @current_station.take_train
      puts "Поезд поехал на предыдущую станцию #{current_station.name}"
    end
  end

  def set_route(route)
   @marshrut = route
  end

  def put_train_on_route
    current_station.take_train(self)      # разобрать селф !!!
    #@train_on_route = @marshrut[@index]
  end


  def show_stations
    puts "now is #{current_station.name} station"
    puts "last station is #{last_station.name}" if @index > 0
    puts "next station is #{next_station.name}" if @index != -1
  end
end
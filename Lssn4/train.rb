class Train
  
  attr_reader :type
  attr_reader :number
  attr_reader :current_station
  attr_reader :speed 
  #attr_reader :wagons_quantity # 
  attr_reader :wagons
  

  def initialize(number)
	  @number = number
    @type = type
    @wagons_quantity = 0
    @speed = 0
    @index = 0
    @wagons = []
  end
  
  def wagons_quantity
    wagons.size
  end

  def speed_up
    puts "скорость поднята"
    @speed += 13
  end

  def speed_stop
    puts "скорость сброшена"
    @speed = 0
  end
  
  def add_wagon(wagon)
    if @speed == 0 
      if wagon.type == self.type
        @wagons << wagon    #@wagons_quantity += 1
      puts "вагон(#{wagon}) прибавлен"
      else 
        puts "Wrong Type = (#{wagon.type})"
      end
    else
      puts "Не смог прибавить вагон(еще едем)"
    end
  end

  def del_wagon(wagon)
    if @wagons.size.zero?
      pust "вагонов на отцепку нет"
    elsif @speed.zero?
      @wagons.delete(wagon) 
      puts "вагон (#{wagon}) отцеплен"
    else
      "остановись и отстегни"
    end
  end
  

  def current_station
    @current_station = @marshrut.stations[@index]
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
    if next_station == nil.class || @index == -1
      puts "дальше нет станций"
    else
      puts "next station is #{next_station.name}"
    end

    #puts "next station is #{next_station.name}" if @index != -1 || nil.class
  end
  
  protected #тут принцип Инкапсуляции   protected-чтоб был доступет в пассажирском и грузовом
  #(юзеру нет доступа на использование этих методов тк не нужно ему это)
  # из серии = мне не нужно знать какими методами духовка греется 
  # я тупо юзаю дозволеные мне методы (нажал кнопочку а духовка сама там внутри себя разберется)
  
  attr_reader :index # он тут тк не использую его как метод а вызываю его из другого
  attr_reader :station
  attr_reader :route

  #attr_writer :type
  #attr_writer :number
  #attr_writer :current_station
  #attr_writer :route
  #attr_writer :station

  def last_station
    @last_station = @marshrut.stations[@index.pred]
  end

  def next_station
    @marshrut.stations[@index.next] || nil.class
    #@next_station = @marshrut.stations[@index.next] #succ аналог next
  end
end

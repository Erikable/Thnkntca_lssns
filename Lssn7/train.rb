class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :type, :number, :current_station, :speed, :wagons, :carriages

  @@trains = {}
  NUMBER_FORMAT = /^[0-9a-z]{3}-?[0-9a-z]{2}$/i
  TRAIN_FORMAT = /^[a-zA-Z0-9]+$/

  def initialize(number, manufacturer)
    @number = number
    @manufacturer = manufacturer
    validate!
    @wagons_quantity = 0
    @speed = 0
    @index = 0
    @carriages = []
    @@trains[number] = self
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def self.find(number)
    @@trains[number]
  end

  def speed_up
    @current_speed += 13
  end

  def stop_train
    @current_speed = 0
  end

  def add_carriage(carriage)
    if @speed == 0 
      if carriage.type == self.type
        @carriages.push(carriage)
      puts "Вагон(#{carriage.type}) прибавлен (всего вагонов прицеплено - #{@carriages.size} )"
      else 
        puts "Не верный тип вагона = (#{carriage.type})"
      end
    else
      puts "Останови поезд, а только потом пристегивай вагон!"
    end
  end

  def del_carriage(carriage)
    if @carriages.size.zero?
      puts "Вагонов на отцепку нет"
    elsif @speed.zero?
      @carriages.delete(carriage) 
      puts "Вагон (#{carriage}) отцеплен (всего вагонов прицеплено - #{@carriages.size} )"
    else
      "Останови поезд и отстегни вагон!"
    end
  end
  
  def set_route(route)
    @marshrut = route
    current_station.take_train(self)
  end

  def current_station
    @current_station = @marshrut.route[@index] 

  end

  def go_to_next_station
    if current_station == @marshrut.route.last
      puts "Поезд уже на последней станции!!!(не может двигаться вперед)"
    else
      current_station.send_train(self) 
      @index += 1
      current_station.take_train(self)
      puts "Поезд прибыл на следующую станцию #{current_station.title}"
    end
  end

  def go_to_last_station
    if current_station == @marshrut.route.first #@index == 0
      puts "Поезд на первой станции!!!(не может двигаться назад)"
    else
      current_station.send_train(self)
      @index -= 1
      current_station.take_train(self)
      puts "Поезд поехал на предыдущую станцию = #{current_station.title}"
    end
  end

protected 

  attr_reader :index, :station, :route

  def last_station
    if @index.pred < 0
      @marshrut.route.first
    else 
      @last_station = @marshrut.route[@index.pred]
    end
  end

  def next_station
    @marshrut.route[@index.next]
  end

  def validate!
    raise "Название поезда должно содержать не менее 5 знаков в формате ХХХ-ХХ" if number.to_s.length < 5 
    raise "Номер позда не верного формата (верный формат ХХХ-ХХ) " if number !~ NUMBER_FORMAT
    raise "Не ввели название производителя для поезда!" if manufacturer !~ TRAIN_FORMAT
  end
end







class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :type
  attr_reader :number
  attr_reader :current_station
  attr_reader :speed 
  attr_reader :wagons
  attr_reader :carriages
  attr_reader :manufacturer
  attr_writer :manufacturer

  @@trains = {}
  NUMBER_FORMAT = /^[0-9a-z]{3}-?[0-9a-z]{2}$/i  #/\^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/
  TF = /^[a-zA-Z0-9]+$/
  def initialize(number, manufacturer)
    @number = number
    @manufacturer = manufacturer
    validate!
    @wagons_quantity = 0
    @speed = 0
    @index = 0
    @carriages = []
    @@trains[number] = self
    register_instance # увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора
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
      puts "вагон(#{carriage.type}) прибавлен"
      puts "вагонов на борту | #{@carriages.size} |"
      else 
        puts "Wrong Type = (#{carriage.type})"
      end
    else
      puts "Не смог прибавить вагон(еще едем)"
    end
  end

  def del_carriage(carriage)
    if @carriages.size.zero?
      puts "вагонов на отцепку нет"
    elsif @speed.zero?
      @carriages.delete(carriage) 
      puts "вагон (#{carriage}) отцеплен"
      puts "вагонов на борту | #{@carriages.size} |"
    else
      "остановись и отстегни"
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
      puts "поезд на последней станции!!!"
    else
      current_station.send_train(self) 
      @index += 1
      current_station.take_train(self)
      puts "поезд прибыл на следующую станцию #{current_station.title}"
    end
  end

  def go_to_last_station
    if current_station == @marshrut.route.first #@index == 0
      puts "поезд на первой станции!!!"
    else
      current_station.send_train(self)
      @index -= 1
      current_station.take_train(self)
      puts "Поезд поехал на предыдущую станцию = #{current_station.title}"
    end
  end

  protected 

  attr_reader :index 
  attr_reader :station
  attr_reader :route

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
    raise "Number can't be nil" if number.nil?
    raise "number can't be empty" if number == ""
    raise "Должно быть не менее 5 знаков в виде ХХХ-ХХ" if number.to_s.length < 5 
    raise "Номер позда has invalid format" if number !~ NUMBER_FORMAT
    raise "имя производителя пусто! теперь создавай поезд заново!" if manufacturer !~ TF # не понял почему но метод Эмпти не прокатил поэтому выкрутился так
  end
end






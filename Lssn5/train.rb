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

  @@trains = {}
  def initialize(number)
    @number = number
    @wagons_quantity = 0
    @speed = 0
    @index = 0
    @carriages = []
    @@trains[number] = self
    register_instance # увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора
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

  protected #тут принцип Инкапсуляции   protected-чтоб был доступет в пассажирском и грузовом
  #(юзеру нет доступа на использование этих методов тк не нужно ему это)
  # из серии = мне не нужно знать какими методами духовка греется 
  # я тупо юзаю дозволеные мне методы (нажал кнопочку а духовка сама там внутри себя разберется)
  attr_reader :index # он тут тк не использую его как метод а вызываю его из другого
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

end







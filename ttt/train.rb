class Train

  attr_accessor :current_speed, :carriages, :current_route, :number, :type, :route
  attr_accessor :stations
  def initialize(number)#, type)
    @number = number
    #@type = type
    @wagons_quantity = 0
    @speed = 0
    @index = 0
    @carriages = []
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
      puts "вагонов на борту | #{carriages.size} |"
      else 
        puts "Wrong Type = (#{carriage.type})"
      end
    else
      puts "Не смог прибавить вагон(еще едем)"
    end
  end
  def del_carriage(carriage)
    if @carriages.size.zero?# || nil.class
      puts "вагонов на отцепку нет"
    elsif @speed.zero?
      @carriages.delete(carriage) 
      puts "вагон (#{carriage}) отцеплен"
    else
      "остановись и отстегни"
    end
  end

  
  def set_route(route)
   @marshrut = route
  end
  
  def put_train_on_route
    @current_station.take_train(self) 
    #@train_on_route = @marshrut[@index]
  end

  def current_station
    @current_station = @marshrut.route[@index] 

  end

  def last_station
    @last_station = @marshrut.route[@index.pred]
  end

  def next_station
    @marshrut.route[@index.next]
  end

  def go_to_next_station
    if current_station == @marshrut.route.size - 1
      puts "поезд на последней станции!!!"
    else
      @current_station.send_train(self) 
      @current_station = next_station 
      @index += 1
      @current_station.take_train(self)
      puts "поезд прибыл на следующую станцию #{@current_station.title}"
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




end







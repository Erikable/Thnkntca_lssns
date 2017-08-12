class Train

  attr_accessor :current_speed, :carriages, :current_station, :current_route, :number, :type, :route
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


  def take_route(route)
    @route = route
    @current_station = @route.route[@index]#.first
    puts "Поезду назначен маршрут следования."
    puts "Поезд находится на станции #{current_station} (маршрут от #{@route.route.first} до #{@route.route.last})"
  end
  
  def next_station
    @route.route[@index.next]
    #next_station = @current_station[@index + 1] #current_station[] #@route.route[]  # stations[@index.next]
  end

  def last_station
    last_station = current_station[pred]
  end

  def go_to_next_station
    
    #next_station #это следущая ст W

    @current_station.send_train(self)

    #if @index == @route.stations[-1] 
    #  puts "поезд на последней станции!!!"
    #else
    #  @current_station.send_train(self) 
    #  @current_station = next_station 
    #  @index += 1
    #  @current_station.take_train(self)
    #  puts "поезд прибыл на следующую станцию #{@current_station.name}"
    #end
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







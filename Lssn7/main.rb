require_relative "instancecounter"
require_relative "manufacturer"
require_relative "station.rb"
require_relative "route.rb"
require_relative "train.rb"
require_relative "passenger_train"
require_relative "cargo_train"
require_relative "carriage.rb"
require_relative "cargo_carriage"
require_relative "passenger_carriage"

class Main
  attr_reader :routes, :trains, :stations, :train, :carriages
  def initialize
    @trains = []
    @stations = []
    @routes = []
    @carriages = []
  end

  def create_station
    puts "ВВедите название станции:"
    title = gets.chomp.capitalize
    station_title = Station.new(title)
    @stations.push(station_title)
  rescue RuntimeError => r
    puts "Станция не создана"
    puts "Ошибка: #{r.message}"
  retry 
  end
  
  def create_train
    puts "введи номер поезда (xxx-xx):"
    number = gets.chomp
    puts "ВВедите имя производителя: "
    manufacturer = gets.chomp.to_s
    puts "Выберите его тип:"
    puts "1 - Пассажирский     2 - Грузовой"
    type = gets.to_i
    if type == 1
      train = PassengerTrain.new(number, manufacturer)
      @trains.push(train)
    elsif type == 2
      train = CargoTrain.new(number, manufacturer)
      @trains.push(train)
    end
  rescue RuntimeError => e
    puts "Поезд не создан !"
    puts "ошибка: #{e.message}"
  retry 
  end

  def create_route
    raise "Для создания маршрута Вы должны создать мин. 2 станции !" if stations.size < 2
    list_of_stations
    puts "Создание маршрута...\nВедите станцию отправления:"
    start_station = gets.to_i
    list_of_stations
    puts "Введите станцию назначения"
    end_station = gets.to_i
    route = Route.new(@stations[start_station - 1], @stations[end_station - 1])
    @routes.push(route)
    puts "Маршрут #{route.stations} создан"
  rescue RuntimeError => w
    puts "Маршрут не создан"
    puts "Ошибка: #{w.message}"
  end

  def create_carriage
    puts "Выберите тип вагона:"
    puts "1 - Пассажирский / 2 - Грузовой"
    type = gets.to_i
    puts "Напишите производителя вагона:"
    manufacturer = gets.chomp
    if type == 1
      puts "ВВедите кол-во мест:"
      seats = gets.to_i
      carriage = PassengerCarriage.new(manufacturer, seats)
      @carriages.push(carriage)
      puts " #{carriage.inspect} - добавлен в базу вагонов"
    elsif type == 2
      puts "Ведите объем:"
      volume = gets.to_i
      carriage = CargoCarriage.new(manufacturer, volume)
      @carriages.push(carriage)
      puts " #{carriage.inspect} добавлен в базу вагонов"
    else
      puts "неверно ввели тип !"
      raise
    end
  end

  def take_seat_or_volume
    
  end

  def add_station_to_route
    route = choose_route
    puts "Выбери номер станции для добавления в маршрут"
    choose_station
    route.add_station(@st)
    puts "Промеж. станция добавлена в маршрут: (#{route})"
  end

  def del_station_from_route
    route = choose_route
    puts "Выбери номер станции для удаления из маршрут"
    choose_station
    route.del_station(@st)
  end

  def add_carriage_to_train
    puts "Введите название производителя вагона"
    manufacturer = gets.chomp
    train = choose_train
    puts "Выберите тип вагона:"
    puts "1 - Пассажирский     2 - Грузовой"
    type = gets.to_i
    if type == 1
      carriage = PassengerCarriage.new(manufacturer)
      train.add_carriage(carriage)
    elsif type == 2
      carriage = CargoCarriage.new(manufacturer)
      train.add_carriage(carriage)
      puts train.carriages
    else puts "Ошибка (ввели не существующую команду)"
    end
  rescue RuntimeError => e
    puts "Вагон не прибавлен!"
    puts "Ошибка: #{e.message}"
  retry 
  end

  def del_carriage_from_train
    train = choose_train
    carriage = choose_carriage(train)
    train.del_carriage(carriage)
    puts "Вагон отцеплен"
  end

  def list_of_stations
    puts "Просмотр всех имеющихся станций"
    @stations.each_with_index {|station, i| puts "#{i + 1} - #{station.title}"}
  end

  def show_trains_on_station
    puts "Выберите номер нужной станции на которой проверим наличие поезда:"
    puts @stations.inspect
    @stations.each_with_index {|station, i| puts "#{i + 1} - #{station.title}"}
    station = gets.to_i
    current_station = @stations[station - 1]
    puts @stations[station - 1].trains.inspect  
  end

  def move_forward
    train = choose_train
    train.go_to_next_station
  end

  def move_back
    train = choose_train
    train.go_to_last_station
  end

  def show_ready_routes
    @routes.each_with_index {|r, i| puts "Готовый маршрут: #{i + 1} - #{r.inspect}"} #не дошло как вызвать из массива станции
  end

  def trains
    @trains.each_with_index {|t, i| puts "#{i + 1} - #{t.number} (тип- #{t.type} производитель- #{t.manufacturer}) "}
  end

  def appoint_route
    train = choose_train
    route = choose_route
    train.set_route(route)
    puts train.current_station
    puts "Поезд #{train.number} расположен на #{train.current_station.title}"
  end

  def find
    puts "Введите номер поезда для его поиска:"
    number = gets.to_i
    hf = Train.find(number)
    puts "Поезд - #{hf.number} | #{hf.type}"
  end

  def choose_carriage_to_fill
    if @carriages.size >= 1 
      puts "Выберите порядковый номер нужного вагона"
      @carriages.each_with_index {|c, i| puts "#{i + 1} - #{c.inspect}"}
      index_of_carriage = gets.to_i
      @carriages[index_of_carriage - 1]
    end
  end
  
  def start_game
    File.open('commands.txt').each { |c| puts c }
    loop do
      puts "Введите номер комадны"
      command = gets.to_i
      case command
        when 1 then create_station  # done
        when 2 then create_train  # done
        when 3 then create_route     #done
        when 4 then list_of_stations  #
        when 5 then show_trains_on_station #list_of_trains  #
        when 6 then appoint_route  #
        when 7 then add_carriage_to_train   #  
        when 8 then del_carriage_from_train  # 
        when 9 then trains
        when 10 then move_forward
        when 11 then move_back
        when 11 then put_train_on_route
        when 12 then show_ready_routes #
        when 13 then add_station_to_route  #
        when 14 then del_station_from_route #
        when 15 then find
        when 16 then create_carriage
        when 17 then choose_carriage_to_fill
        when 0 then exit                                                
        else
          puts "Что-то не так ввел"  
      end   
    end
  end

  private
  attr_writer :routes, :trains, :stations

  def choose_train
    puts "Выберите порядковый номер нужного поезда"
    @trains.each_with_index {|train, index| puts " #{index + 1} - #{train.number} (#{train.type})"}
    index_of_train = gets.to_i
    @trains[index_of_train - 1] 
  end

  def choose_carriage(train)
    puts "Выберите вагон"
    train.carriages.each_with_index {|carriage, index| puts "Вагон (#{carriage.type})  номер #{index + 1}"}
    index_of_carriage = gets.to_i
    train.carriages[index_of_carriage - 1]
  end

  def choose_route
    puts "Выберите маршрут из списка"
    if @routes.empty?
      puts "Сначало зарегистрируйте маршруты"
    else
    @routes.each_with_index {|route, index| puts "#{index + 1} - #{route.inspect}"}
    index_of_route = gets.to_i
    routes[index_of_route - 1]
    end
  end

  def choose_station
    @stations.each_with_index {|st, i| puts " #{i + 1} - #{st.title}"}
    index_of_station = gets.to_i
    @st = stations[index_of_station - 1]
  end

end








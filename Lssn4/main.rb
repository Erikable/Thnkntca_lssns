require_relative "station.rb"
require_relative "route.rb"
require_relative "train.rb"
require_relative "passenger_train"
require_relative "cargo_train"
require_relative "carriage.rb"
require_relative "cargo_carriage"
require_relative "passenger_carriage"

class Main
  attr_reader :routes, :trains, :stations, :train
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def create_station
    puts "ВВедите название станции:"
    title = gets.chomp.capitalize
    station_title = Station.new(title)
    @stations.push(station_title)
  end

  def create_train
    puts "введи номер поезда:"
    number = gets.to_i
    puts "Выберите его тип:"
    puts "1 - Пассажирский     2 - Грузовой"
    type = gets.to_i
    if type == 1
      train = PassengerTrain.new(number)
      @trains.push(train)
    elsif type == 2
      train = CargoTrain.new(number)
      @trains.push(train)
    else
      puts "видимо ошибся во вводе"
      puts "попробуй заного"
      return create_train 
    end
  end

  def create_route
    list_of_stations
    puts "Создание маршрута...\nВедите станцию отправления:"
    start_station = gets.to_i
    list_of_stations
    puts "Введите станцию назначения"
    end_station = gets.to_i
    route = Route.new(@stations[start_station - 1], @stations[end_station - 1])
    @routes.push(route)
    puts "маршрут #{route.stations} создан"
  end

  def add_station_to_route
    route = choose_route
    puts "выбери номер станции для добавления в маршрут"
    choose_station
    #@stations.each_with_index {|st, i| puts " #{i + 1} - #{st.title}"}
    #index_of_station = gets.to_i
    #st = stations[index_of_station - 1]
    route.add_station(@st)
    puts "промеж. станция добавлена в маршрут: (#{route})"
  end

  def del_station_from_route
    route = choose_route
    puts "выбери номер станции для удаления из маршрут"
    choose_station
    #@stations.each_with_index {|st, i| puts " #{i + 1} - #{st.title}"}
    #index_of_station = gets.to_i
    #st = stations[index_of_station - 1]
    route.del_station(@st)
  end

  def add_carriage_to_train
    train = choose_train
    puts "выберите тип вагона:"
    puts "1 - Пассажирский     2 - Грузовой"
    type = gets.to_i
    if type == 1
      carriage = PassengerCarriage.new
      train.add_carriage(carriage)
      #puts train.carriages
    elsif type == 2
      carriage = CargoCarriage.new
      train.add_carriage(carriage)
      puts train.carriages
    else puts "error"
    end
  end

  def del_carriage_from_train
    train = choose_train
    carriage = choose_carriage(train)
    train.del_carriage(carriage)
    puts "вагон отцеплен"
  end

  def list_of_stations
    puts "просмотр всех имеющихся станций"
    @stations.each_with_index {|station, i| puts "#{i + 1} - #{station.title}"}
  end

  def show_trains_on_station
    puts "выберите номер нужной станции на которой проверим наличие поезда:"
    puts @stations.inspect
    @stations.each_with_index {|station, i| puts "#{i + 1} - #{station.title}"}
    station = gets.to_i
    current_station = @stations[station - 1]
    #puts "поезда на станции #{current_station.title} :"
    puts @stations[station - 1].trains.inspect  
    #@stations[station - 1].trains.each_with_index {|train, i| puts "#{i} #{train}"}  #!!!!!!!!!
    #@trains.each_with_index {|train, i| puts "#{i + 1} - #{train}" }
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
    @routes.each_with_index {|r, i| puts "готовый маршрут: #{i + 1} - #{r.inspect}"} #не дошло как вызвать из массива станции
  end

  def trains
    @trains.each_with_index {|t, i| puts "#{i + 1} - #{t.number} (#{t.type}) "}
  end

  def appoint_route
    train = choose_train
    route = choose_route
    train.set_route(route)
    puts train.current_station

    #train.current_station.take_train(train)
    puts "поезд #{train.number} расположен на #{train.current_station.title}"
  end
  
  def start_game
    File.open('commands.txt').each { |c| puts c }
    loop do
      puts "введите номер комадны"
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
        when 0 then exit                                                
        else
          puts "что то не так ввел"  
      end   
    end
  end

  private
  attr_writer :routes, :trains, :stations

  def choose_train
    puts "выберите порядковый номер нужного поезда"
    @trains.each_with_index {|train, index| puts " #{index + 1} - #{train.number} (#{train.type})"}
    index_of_train = gets.to_i
    @trains[index_of_train - 1] 
  end

  def choose_carriage(train)
    puts "выберите вагон"
    train.carriages.each_with_index {|carriage, index| puts "Вагон (#{carriage.type})  номер #{index + 1}"}
    index_of_carriage = gets.to_i
    train.carriages[index_of_carriage - 1]
  end

  def choose_route
    puts "выберите маршрут из списка"
    if @routes.empty?
      puts "сначало зарегистрируйте маршруты"
    else
    @routes.each_with_index {|route, index| puts "#{index + 1} - #{route.inspect}"} # вот тут не дошло до меня
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








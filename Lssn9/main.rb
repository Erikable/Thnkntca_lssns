# frozen_string_literal: true

require_relative 'instancecounter'
require_relative 'manufacturer'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage.rb'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'partofmain'

class Main
  include PartOfMain

  attr_reader :routes, :trains, :stations, :train, :carriages
  def initialize
    @trains = []
    @stations = []
    @routes = []
    @carriages = []
  end

  def add_station_to_route
    route = choose_route
    puts 'Выбери номер станции для добавления в маршрут'
    choose_station
    route.add_station(@st)
    puts "Промеж. станция добавлена в маршрут: (#{route})"
  end

  def del_station_from_route
    route = choose_route
    puts 'Выбери номер станции для удаления из маршрут'
    choose_station
    route.del_station(@st)
  end

  def add_carriage_to_train
    carriage = choose_wagon
    train = choose_train
    train.add_carriage(carriage)
  end

  def del_carriage_from_train
    train = choose_train
    carriage = choose_carriage(train)
    train.del_carriage(carriage)
    puts 'Вагон отцеплен'
  end

  def list_of_stations
    puts 'Просмотр всех имеющихся станций'
    @stations.each_with_index do |station, i|
      puts "#{i + 1} - #{station.title}"
    end
  end

  # def show_trains_on_station
  #  puts 'Выберите номер нужной станции на которой проверим наличие поезда:'
  #  puts @stations.inspect
  #  @stations.each_with_index do |station, i|
  #    puts "#{i + 1} - #{station.title}"
  #  end
  #  station = gets.to_i
  #  current_station = @stations[station - 1]
  #  puts @stations[station - 1].trains.inspect
  # end

  def move_forward
    train = choose_train
    train.go_to_next_station
  end

  def move_back
    train = choose_train
    train.go_to_last_station
  end

  def show_ready_routes
    @routes.each_with_index do |r, i|
      puts "Готовый маршрут: #{i + 1} - #{r.inspect}"
    end
  end

  def trains
    @trains.each_with_index do |t, i|
      puts "#{i + 1} - #{t.number} (тип- #{t.type}
            производитель- #{t.manufacturer})"
    end
  end

  def appoint_route
    train = choose_train
    route = choose_route
    train.determine_route(route)
    puts train.current_station
    puts "Поезд #{train.number} расположен на #{train.current_station.title}"
  end

  def find
    puts 'Введите номер поезда для его поиска:'
    number = gets.to_i
    hf = Train.find(number)
    puts "Поезд - #{hf.number} | #{hf.type}"
  end

  def fill_carriage
    puts 'Сейчас будем заполнять наш вагон...'
    c = choose_carriage_to_fill
    if c.type == :passenger
      c.take_a_seat
      puts "мы заполнили одно место (осталось #{c.free_seats}
            / занято #{c.occupied_seats})"
    elsif c.type == :cargo
      puts 'Введите кол-во кубов которые мы заполним:'
      cubs = gets.to_i
      c.take_a_volume(cubs)
      puts "мы заполнили #{cubs} кубов (осталось #{c.free_volume}
            / занято #{c.occupied_volume})"
    end
  end

  def show_trains_on_station
    # st = choose_station
    choose_station.each_train do |train|
      puts "Поезд - #{train.number} / #{train.type} / #{train.manufacturer}"
    end
  end

  def show_wagons_on_train
    # train = choose_train
    choose_train.each_wagon do |wagon|
      puts "Тип - #{wagon.type} / Производитель - #{wagon.manufacturer}"
    end
  end

  def start_game
    File.open('commands.txt').each { |c| puts c }
    loop do
      puts 'Введите номер комадны'
      command = gets.to_i
      buttons = { 1 => 'create_station', 2 => 'create_train',
                  3 => 'create_route', 4 => 'list_of_stations',
                  5 => 'show_trains_on_station', 6 => 'appoint_route',
                  7 => 'add_carriage_to_train', 8 => 'del_carriage_from_train',
                  9 => 'trains', 10 => 'move_forward', 11 => 'move_back',
                  12 => 'show_ready_routes', 13 => 'add_station_to_route',
                  14 => 'del_station_from_route', 15 => 'find',
                  16 => 'create_carriage', 17 => 'fill_carriage',
                  18 => 'show_trains_on_station', 19 => 'show_wagons_on_train',
                  0 => 'exit' }

      d = buttons[command]
      send d

      # case command
      # when 1 then create_station # done
      # when 2 then create_train # done
      # when 3 then create_route # done
      # when 4 then list_of_stations #
      # when 5 then show_trains_on_station # list_of_trains  #
      # when 6 then appoint_route #
      # when 7 then add_carriage_to_train #
      # when 8 then del_carriage_from_train #
      # when 9 then trains
      # when 10 then move_forward
      # when 11 then move_back
      # when 11 then put_train_on_route
      # when 12 then show_ready_routes #
      # when 13 then add_station_to_route #
      # when 14 then del_station_from_route #
      # when 15 then find
      # when 16 then create_carriage
      # when 17 then fill_carriage
      # when 18 then show_trains_on_station
      # when 19 then show_wagons_on_train
      # when 0 then exit
      # else
      # puts 'enter smthng wrong'
      # end
    end
  end

  private

  attr_writer :routes, :trains, :stations

  def choose_train
    puts 'Выберите порядковый номер нужного поезда'
    @trains.each_with_index do |train, index|
      puts "#{index + 1} - #{train.number} (#{train.type})"
    end
    index_of_train = gets.to_i
    @trains[index_of_train - 1]
  end

  def choose_wagon
    puts 'Выберите номер вагона'
    @carriages.each_with_index do |carriage, index|
      puts "Вагон - #{carriage}   номер - #{index + 1}"
    end
    carriage_num = gets.to_i
    @carriages[carriage_num - 1]
  end

  def choose_carriage(train)
    puts 'Выберите вагон'
    train.carriages.each_with_index do |carriage, index|
      puts "Вагон (#{carriage.type})  номер #{index + 1}"
    end
    index_of_carriage = gets.to_i
    train.carriages[index_of_carriage - 1]
  end

  def choose_route
    puts 'Выберите маршрут из списка'
    if @routes.empty?
      puts 'Сначало зарегистрируйте маршруты'
    else
      @routes.each_with_index do |route, index|
        puts "#{index + 1} - #{route.inspect}"
      end
      index_of_route = gets.to_i
      routes[index_of_route - 1]
    end
  end

  def choose_station
    @stations.each_with_index { |st, i| puts " #{i + 1} - #{st.title}" }
    index_of_station = gets.to_i
    @st = stations[index_of_station - 1]
  end

  def choose_carriage_to_fill
    if @carriages.size >= 1
      puts 'Выберите порядковый номер нужного вагона'
      @carriages.each_with_index { |c, i| puts "#{i + 1} - #{c.inspect}" }
      index_of_carriage = gets.to_i
      @carriages[index_of_carriage - 1]
    else
      puts 'Еще не существует вагонов'
    end
  end
end

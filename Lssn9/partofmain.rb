# frozen_string_literal: true

module PartOfMain
  def create_station
    puts 'ВВедите название станции:'
    title = gets.chomp.capitalize
    station_title = Station.new(title)
    @stations.push(station_title)
    puts "станция создана"
  rescue RuntimeError => r
    puts 'Станция не создана'
    puts "Ошибка: #{r.message}"
    retry
  end

  def create_train
    puts 'введи номер поезда (xxx-xx):'
    number = gets.chomp
    puts 'ВВедите имя производителя: '
    manufacturer = gets.chomp.to_s
    puts 'Выберите его тип:'
    puts '1 - Пассажирский     2 - Грузовой'
    type = gets.to_i
    if type == 1
      train = PassengerTrain.new(number, manufacturer)
      @trains.push(train)
    elsif type == 2
      train = CargoTrain.new(number, manufacturer)
      @trains.push(train)
    end
  rescue RuntimeError => e
    puts 'Поезд не создан !'
    puts "ошибка: #{e.message}"
    retry
  end

  def create_route
    raise 'Для создания маршрута нужно создать 2 станции !' if stations.size < 2
    list_of_stations
    puts "Создание маршрута...\nВедите станцию отправления:"
    start_station = gets.to_i
    list_of_stations
    puts 'Введите станцию назначения'
    end_station = gets.to_i
    route = Route.new(@stations[start_station - 1], @stations[end_station - 1])
    @routes.push(route)
    puts "Маршрут #{route.stations} создан"
  rescue RuntimeError => w
    puts 'Маршрут не создан'
    puts "Ошибка: #{w.message}"
  end

  def create_carriage
    puts 'Выберите тип вагона:'
    puts '1 - Пассажирский / 2 - Грузовой'
    type = gets.to_i
    puts 'Напишите производителя вагона:'
    manufacturer = gets.chomp
    if type == 1
      puts 'ВВедите кол-во мест:'
      seats = gets.to_i
      carriage = PassengerCarriage.new(manufacturer, seats)
      @carriages.push(carriage)
      puts " #{carriage.inspect} - добавлен в базу вагонов"
    elsif type == 2
      puts 'Ведите объем:'
      volume = gets.to_i
      carriage = CargoCarriage.new(manufacturer, volume)
      @carriages.push(carriage)
      puts " #{carriage.inspect} добавлен в базу вагонов"
    else
      puts ' неизвестная ошибка ! попробуй еще раз'
    end
  rescue RuntimeError => e
    puts 'Вагон не прибавлен!'
    puts "Ошибка: #{e.message}"
    retry
  end
end

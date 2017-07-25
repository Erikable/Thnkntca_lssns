class Station

  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train)
  end
  
  def send_train(train)
    @trains.delete(train)
  end


  def all_trains
    @trains.each {|train| puts train.number}
  end

  def show_trains_type(type)
    @trains.each do |train|
      puts " Train = #{train.number} его тип = #{train.type} и находится он на станции #{self.name}" if train.type == type
    end
  end


end

=begin
Станция:
Имеет название, которое указывается при ее создании
Может принимать поезда
Может показывать список всех поездов на станции, находящиеся в текущий момент
Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
=end

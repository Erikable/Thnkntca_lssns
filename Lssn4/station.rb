class Station

  attr_reader :name
 
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
      puts " Train = #{train.number} его тип = #{train.type}  находится он на станции #{self.name}" if train.type == type
    end
  end
  
  # все методы в паблике, аналогичто маршруту
  private
  attr_reader :trains #
end

class Car
  attr_reader :current_rpm

  def initialize
    @current_rpm = 0  
  end

  def start_engine
    start_engine! if engine_stopped?  # (! - Бэнк метод - измен сост самого объекта или метод производит чтото важное)
  end


  def engine_stopped?
    current_rpm = 0 #.zero?
  end
  
  protected
  attr_writer :current_rpm


  def initial_rpm 
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end

# ++++++++++++++++++++++++++++++++++++++++++
class Truck < Car
  def loadind
    
  end
  protected

  def initial_rpm 
    500
  end

end

# ++++++++++++++++++++++++++++++++++++++++++
class SportCar < Car
  def start_engine
    super
    puts "sportcar starting engine now"
  end
protected

  def initial_rpm 
    1000
  end
end

#++++++++++++++++++++++++++++++++++++++++++
class Driver

  def drive(car)
    car.start_engine
  end

end








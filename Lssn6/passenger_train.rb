class PassengerTrain < Train
  def initialize(number)
    @type = :passenger
  	super
  end

  def valid?
    validate!
  rescue
    false
  end
  def validate!
    raise "Тип не того типа" if self.train != self.type
    true
  end

end
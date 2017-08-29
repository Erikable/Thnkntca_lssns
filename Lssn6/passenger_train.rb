class PassengerTrain < Train
  def initialize(number)
    @type = :passenger
  	super
  end

  def validate! # вообще наверно идиотизм проверять это,,,
    raise "Тип не того типа" if self.type != :passenger
    super
  end

end
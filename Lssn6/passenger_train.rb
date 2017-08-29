class PassengerTrain < Train
  def initialize(number, manufacturer)
    @type = :passenger
  	super
  end

protected # тут и в приват можно так понимаю

  def validate! # вообще наверно идиотизм проверять это,,,
    raise "Тип не того типа" if self.type != :passenger
    super
  end

end
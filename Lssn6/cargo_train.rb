class CargoTrain < Train
  def initialize(number, manufacturer)
    @type = :cargo
    super
  end

protected

  def validate! # вообще наверно идиотизм проверять это,,,
    raise "Тип не того типа" if self.type != :cargo
    super
  end

end
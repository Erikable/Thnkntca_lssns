class CargoTrain < Train
  def initialize(number, manufacturer)
    @type = :cargo
    super
  end
end

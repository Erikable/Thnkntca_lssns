class PassengerTrain < Train
  def initialize(number, manufacturer)
    @type = :passenger
    super
  end
end
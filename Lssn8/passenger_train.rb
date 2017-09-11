# frozen_string_literal: true

class PassengerTrain < Train
  def initialize(number, manufacturer)
    @type = :passenger
    super
  end
end

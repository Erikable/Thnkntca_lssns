# frozen_string_literal: true

class PassengerTrain < Train
	validate :number, :format, NUMBER_FORMAT
  def initialize(number, manufacturer)
    @type = :passenger
    validate!
    super
  end
end

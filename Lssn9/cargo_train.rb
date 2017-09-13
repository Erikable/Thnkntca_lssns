# frozen_string_literal: true

class CargoTrain < Train
  def initialize(number, manufacturer)
    @type = :cargo
    super
  end
end

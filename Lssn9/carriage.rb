# frozen_string_literal: true

class Carriage
  include Manufacturer
  attr_reader :type
  WAGON_FORMAT = /^[a-zA-Z0-9]+$/
  def initialize(manufacturer, type)
    @manufacturer = manufacturer
    @type = type
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise 'Тип вагона не может быть пустым' if type == ''
    raise 'Тип вагона не может быть nil' if type.nil?
    raise 'Не ввели производителя для вагона!' if manufacturer !~ WAGON_FORMAT
  end
end

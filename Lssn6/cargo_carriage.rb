class CargoCarriage < Carriage

  def initialize(manufacturer)
    super(manufacturer, :cargo)
  end
  
end
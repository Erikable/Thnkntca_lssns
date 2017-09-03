class CargoCarriage < Carriage

  attr_accessor :volume 
  attr_reader :occupied_volume

  def initialize(manufacturer, volume)
    super(manufacturer, :cargo)
    @volume = volume
    @occupied_volume = 0
  end

  def take_a_volume(volume)
    @volume -= volume if @volume >= volume 
  end
  
end
class CargoCarriage < Carriage

  attr_accessor :volume 
  attr_reader :occupied_volume

  def initialize(manufacturer, volume)
    super(manufacturer, :cargo)
    @volume = volume
    @occupied_volume = 0
  end

  def take_a_volume(vol)
    @occupied_volume += vol if vol < free_volume 
  end
  
  def free_volume
    @volume - @occupied_volume
  end
end
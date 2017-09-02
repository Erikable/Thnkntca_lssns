class CargoCarriage < Carriage

  attr_accessor :volume 
  attr_reader :occupied_volume

  def initialize(manufacturer, volume)
    super(manufacturer, :cargo)
  end

  def take_a_volume(volume)
    @volume += 1 if @volume > @occupied_volume
  end

  def free_volume
    @volume - @occupied_volume
  end

  def occupied_volume
    @volume - free_volume
  end
  
end
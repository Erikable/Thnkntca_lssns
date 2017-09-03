class CargoCarriage < Carriage

  attr_accessor :volume 
  attr_reader :occupied_volume

  def initialize(manufacturer, volume)
    super(manufacturer, :cargo)
    @volume = volume
    @occupied_volume = 0
  end

  def take_a_volume(vol)
    @occupied_volume += vol if vol < @volume - @occupied_volume
    #@volume -= volume if @volume >= volume 
  end
  
  def free_volume
    @volume - @occupied_volume
  end

  def occupied_volume
    @volume - free_volume
  end

end
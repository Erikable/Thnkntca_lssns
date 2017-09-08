class PassengerCarriage < Carriage
  attr_accessor :seats
  attr_reader :occupied_seats

  def initialize(manufacturer, seats)
    super(manufacturer, :passenger)
    @seats = seats
    @occupied_seats = 0
  end

  def take_a_seat
    @occupied_seats += 1 if @seats > @occupied_seats
  end

  def free_seats
    @seats - @occupied_seats
  end
end

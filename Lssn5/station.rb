class Station 
  attr_reader :title, :trains
  @@stations = []
  def initialize(title)
    @title = title
    @trains = []
    #добавление в @@stantions 
  end

  def self.all
    @@stations
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def all_trains
    puts "поезда на станции #{self.title}:"
    @trains.each_with_index {|t, i| puts "#{i + 1} - #{t.number}/#{t.type}"}
  end

  def get_train_list
    @trains.each { |t| puts t }
  end

  
  def trains_by_type(tr_type)
    arr = @trains.find_all{ |t| t.type == tr_type } 
    arr.size
  end


end
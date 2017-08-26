class Station 
  attr_reader :title, :trains
  @@stations = []
  def initialize(title)
    @title = title
    @trains = []
    @@stations << self 
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end
  
  def validate!
    raise "title can't be nil" if title.nil?
    raise "Ошибка ! должно быть не менее 2 знаков" if title.to_s.length < 2 
    #raise "Number has invalid format" if number !~ NUMBER_FORMAT
    true
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
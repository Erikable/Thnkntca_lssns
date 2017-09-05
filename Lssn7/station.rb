class Station 
  attr_reader :title, :trains
  ES = /^\s*$/
  @@stations = []
  def initialize(title)
    @title = title
    validate!
    @trains = []
    @@stations << self 
  end

#написать метод, который принимает блок и проходит по всем поездам на станции, передавая каждый поезд в блок.
  def each_train
    @trains.each {|train| yield train}
  end

  def valid?
    validate!
    true
  rescue
    false
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
    puts "Поезда на станции #{self.title}:"
    @trains.each_with_index {|t, i| puts "#{i + 1} - #{t.number}/#{t.type}"}
  end

  def get_train_list
    @trains.each { |t| puts t }
  end

  def trains_by_type(tr_type)
    arr = @trains.find_all{ |t| t.type == tr_type } 
    arr.size
  end

private
 
  def validate!
    raise "Название не может быть из пробелов или пустым !" unless title !~ ES
    raise "Должно быть не менее 2 знаков" if title.to_s.length < 2 
  end
end
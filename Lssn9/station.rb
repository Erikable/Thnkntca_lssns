# frozen_string_literal: true
require_relative 'validation'

class Station
  include Validation

  attr_reader :title, :trains
  ES = /^\s*$/
  @stations = []
  validate :title, :presence

  def initialize(title)
    @title = title
    validate!
    @trains = []
    self.class.stations << self
  end

  class << self
    attr_reader :stations

    def all
      self.class.stations
    end
  end

  def each_train
    @trains.each { |train| yield train }
  end

  def take_train(train)
    @trains.push(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def all_trains
    puts "Поезда на станции #{title}:"
    @trains.each_with_index { |t, i| puts "#{i + 1} - #{t.number}/#{t.type}" }
  end

  # def get_train_list
  #   @trains.each { |t| puts t }
  # end

  def trains_by_type(tr_type)
    arr = @trains.find_all { |t| t.type == tr_type }
    arr.size
  end

  private

  #def validate!
  #  raise 'Название не может быть из пробелов или пустым !' unless title !~ ES
  #  raise 'Должно быть не менее 2 знаков' if title.to_s.length < 2
  #end
end

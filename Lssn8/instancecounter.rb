# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :instances # return amount of instances of this class

    protected

    def increase_instances
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    protected

    attr_writer :instances
    def register_instance # Increases the count of the number
      self.class.send :increase_instances
    end
  end
end

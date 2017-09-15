module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *arg)
      @validations |= []
      @validations << {name: name, type: type, args: args}
    end
  end

  module InstanceMethods
    def valid?
      validate!
      rescue
      false
    end

    def validate!
      self.class.validate
    end

    def type(name, attr, class)
      raise
    end

    def presence(name, attr)
      raise
    end

    def format(name, attr, format)
      raise
    end

  end

end
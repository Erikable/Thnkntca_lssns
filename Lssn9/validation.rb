module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *arg)

    end
  end

  module InstanceMethods
    def valid?
      validate!
      raise
      false
    end

    def validate!

    end
  end

end
module Validation


  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validations
    def validate(name, type, *args)
      @validations ||= []
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
      self.class.validations.each do |validation|
        attr = instance_variable_get("@#{validation[:name]}")
        send(validation[:type], attr, *validation[:args]) 
      end
    end

    def presence(attr)
      raise "значение атрибута не может быть nil и пустой строкой !" if attr.nil? || attr.empty?
    end

    def type(attr, attr_class)
      puts attr_class
      raise "не соответствует классу" unless attr.is_a? attr_class
    end

    def format(attr, format)
      raise "не соответствует формату" if attr !~ format
    end

  end

end

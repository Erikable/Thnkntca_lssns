
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
        send validation[:type]#, validation[:name], validation[:args]
      end
    end

    def presence(name, attr)
      raise "#{name} значение атрибута не может быть nil и пустой строкой !" if attr.empty? || attr.nil?
    end

    def type(name, attr, attr_class)
      raise "#{name} не соответствует классу" unless attr.is_a? attr_classp
    end

    def format(name, attr, format)
      raise "#{name} не соответствует формату" if attr !~ format
    end

  end

end

module Acessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*attrs)
      attrs.each do |attr|
        var_name = "@#{attr}".to_sym
        define_method(attr) { instance_variable_get(var_name) }
        define_method("#{attr}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          @var_values ||= {}
          @var_values[attr] ||= []
          @var_values[attr] << value
        end

        define_method("#{attr}_history") { @var_values[attr] }
      end
    end

    def strong_attr_acessor(attr_name, class_type)
      var_name = "@#{attr_name}".to_sym
      define_method(attr_name.to_sym) { instance_variable_get(var_name) }
      define_method("#{name}=") do |value|
        raise 'Ошибка!' unless value.is_a?(class_type)
        instance_variable_set(var_name, value)
      end
    end
  end
end

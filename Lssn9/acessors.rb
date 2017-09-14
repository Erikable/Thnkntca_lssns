module Acessors

  def self.attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
      var_attribute = "@#{attribute}".to_sym
      define_method(attribute) { instance_variable_get(var_attribute) }
      define_method("#{attribute}=".to_sym) do |value| 
        instance_variable_set(var_attribute, value) 
      @history ||= {}
      @history[attribute] ||= []
      @history[attribute] << value #{speed =>[60]}
    end
      define_method("#{attribute}_history") {@history[attribute]}
    end
  end

  def self.strong_attr_acessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |x|
    raise TypeError, "Ошибка" unless x.class.is_a?(type)
    instance_variable_set(var_name, x)
  end
  end

end
module Acessors

  def self.attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
      var_attribute = "@#{attribute}".to_sym
      define_method(attribute) { instance_variable_get(var_attribute) }
      define_method("#{attribute}=".to_sym) { |value| instance_variable_set(var_attribute, value) }
    end
  end

  def self.strong_attr_acessor
    
  end

end
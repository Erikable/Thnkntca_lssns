module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods
    attr_reader :instances #возвращает кол-во экземпляров данного класса
  
    protected	
  
    def increase_instances 
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    protected
    attr_writer :instances
    def register_instance # увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
      self.class.send :increase_instances
    end
  end

end     
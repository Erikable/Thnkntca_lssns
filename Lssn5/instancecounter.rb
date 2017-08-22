module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
	
  module ClassMethods 
  	def instances #возвращает кол-во экземпляров данного класса
      @instances ||= 0
  		@instances
  	end
  end

	module InstanceMethods
    protected
    attr_writer :instances
		def register_instance # увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
			self.class.instances += 1
		end
	end

end
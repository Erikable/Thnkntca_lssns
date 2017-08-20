module InstanceCounter
	
	module ClassMethods 
		def instances #возвращает кол-во экземпляров данного класса
			@instances
		end
	end

	module InstanceMethods
    protected
		def register_instance # увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
			self.class.instances += 1
		end
	end

end
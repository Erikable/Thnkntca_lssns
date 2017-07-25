class Mammle

	#attr_accessor :cn

	def initialize 
		@cn = gets.to_i
	end

	def met
		if @cn.nonzero?
			puts 12 / 2 
		else
			"ne mogy"
		end
	end

end


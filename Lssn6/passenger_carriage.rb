class PassengerCarriage < Carriage 
	include Manufacturer
	def initialize 
		@type = :passenger 
	end
end

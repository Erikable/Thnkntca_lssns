class CargoCarriage < Carriage
	include Manufacturer
	def initialize
		@type = :cargo
	end
end
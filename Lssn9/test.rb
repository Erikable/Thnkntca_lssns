require_relative 'validation'
class Ggg
include Validation
	#validate     :title, :presence
	#validate     :title, :type, String
	validate  :name, :format, /A-Z/
def initialize
end
end

a = Ggg.new 
a.validate!
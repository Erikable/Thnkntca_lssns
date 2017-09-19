require_relative 'validation'
class Ggg
include Validation
	validate     :title, :presence
	#validate     :title, :type, String
	#validate  :name, :format, /A-Z/
attr_accessor :title
def initialize
@title = title
end
end

a = Ggg.new
a.validate!
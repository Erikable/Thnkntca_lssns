

class Game

	def initialize(slovo)
		@slovo = slovo
		@errors = 0
		@good_letter = []
		@bad_letter = []
		@steps = 0
	end	

	def get_letter(slovo)
		if slovo == 'nil' || slovo == ""
			puts "не ввели !"
		end
		slovo.split("")

	end
end










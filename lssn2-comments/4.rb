# 4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
alf = ('a'..'z').to_a
extract = %w[a e i o u y]
num = {}
extract.each do |q|
	if alf.include?(q)
		num[q] = alf.index(q) + 1
	end
end
num.each do |key, value|
	puts "#{key} - #{value}"
end


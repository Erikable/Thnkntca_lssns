#2. Заполнить массив числами от 10 до 100 с шагом 5

arr_nums = []

10.step(100, 5) do |i|
	arr_nums << i
end
print arr_nums


=begin
while nums < 100
	arr_nums2 = []
	nums = nums + 5
	arr_nums2 << nums
	arr_nums << arr_nums2
end
	puts arr_nums
=end
#заполнить массив числами фибоначчи до 100

#f = 1
fib = [0,1]

while fib[-2] + fib[-1] <= 100
#	f = f + 1
	fib.push(fib[-2] + fib[-1])
#	fib[f] = fib[f-2] + fib[f-1]
end

puts fib.inspect

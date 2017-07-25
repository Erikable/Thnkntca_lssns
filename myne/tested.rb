=begin
++++++++++++++++++++++++++
add1 = lambda {|x| x + 1}
add2 = lambda {|x| x + 2}
add3 = lambda {|x| x + 3}

bal = 0
h = {1 => add1, 2 => add2, 3 => add3, 4 => add1, 5 => add3}

loop do
	x = rand(0..10)
	puts "comb = #{x}"
	if h[x]
		f = h[x]
		bal = f.call bal
		puts "lamda called"
	end

	puts "Balance = #{bal}"
	puts "press."
	gets
end




def show_book book 
	puts "+++++++++++++"
	book.keys.each do |a|
		age = book[a]
		puts "Nmae: #{a},  age = #{age}"
	end
	puts "+++++++++++++"
end

book1 = {'mike' => 34}
show_book book1
book2 = {'erok' => 32}
show_book book2





class CountEm
    @@children = 0
    def initialize
      @@children += 1
      @myNumber = @@children
    end
    def whoAmI
     puts "I'm child number #{@myNumber} (out of #@@children)"
    end
    def CountEm.totalChildren
      @@children
    end
  end

  c1 = CountEm.new
  c2 = CountEm.new
  c3 = CountEm.new
  c1.whoAmI
  c3.whoAmI
  #CountEm.totalChildren








class Fff
	attr_accessor :name
	def go
		puts "lets Go #{name}!"
	end

end

d = Fff.new('Erik')
d.go 




+++++++++++++++++++++++++++++++++
class Bird
  def fly
    puts "Я из класса #{self.class}, я лечу"
  end
end

class Parrot < Bird

  attr_reader :name, :age #getter
  attr_writer :name       #setter

  def initialize(name, age = 1)
    @name = name
    @age = age
  end

  def fly #переопределение родительского метода
    super #вызов из родительского метода
    puts "Меня зовут #{@name}"
  end

  def speak
    puts "Я из класса #{self.class}: #{@name}, #{@age}"
  end

end

class Pinguin < Bird
  def fly
    puts "Я - пингвин, я не летаю"
  end
end

b = Bird.new
b.fly #=>"Я из класса Bird, я лечу"

puts
pa = Parrot.new("Кеша", 14)
pa.speak #=>"Я из класса Parrot: Кеша, 14"
pa.name = "Гоша"
pa.speak #=>"Я из класса Parrot: Гоша, 14"

puts
pa.fly #=>"Я из класса Parrot, я лечу\nМеня зовут Гоша"

puts
pingu = Pinguin.new
pingu.fly #=>"Я - пингвин, я не летаю"





class MyClass
  def hello
    p 'hello'
  end
end
o = MyClass.new
o.hello
MyClass.hello



puts "++++++++++++++++++"



class MyClass1
  def self.hello
    p 'hello'
  end
end
MyClass1.hello
o = MyClass1.new
o.hello




list = ['a', 'b', 'c']
vvod = gets.chomp

list.each do |o|
	if o.include?(vvod)
		puts "#{vvod}"
	else
		puts "*"
	end
	
end
=end
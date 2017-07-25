class Train
    
    #Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
    def initialize(type, number)
    	@speed = 0
    	@wagons_quantity = 0
    	@type = type
    	@number = number
    	@index = 0
    end

	#набирать скорость
    def speed_up
    	@speed += 10
    end

    #показывать текущую скорость
    def show_speed
    	puts @speed
    end

    #тормозить
    def speed_stop
    	@speed = 0
    end  
    
    #показывать количество вагонов
    def show_wagons_quantity
    	@wagons_quantity
    end  
      
    #прицеплять/отцеплять вагоны (по одному вагону за операцию, 
    #Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
    def add_wagon
    	if speed == 0 
    		@wagons_quantity += 1
    	else
    		puts "Поезд едет! Нельзя прицепить!"
    	end
    end
    def del_wagon
    	if @speed.zero?
    		if @wagons_quantity > 0
    			@wagons_quantity -= 1
    			puts "вагон удален"
    		else
    			puts "Нет вагонов для удаления"
    		end
    	else
    		puts "Тормози поезд сначала !"
    end
     
      
	#-Может принимать маршрут следования (объект класса Route). 
	#-При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
	def set_route(route)
		@marshrut = route
	end
	def put_on_route

	end

	#текущ ст
	def current_station
		
	end
	#прош ст
	#буд ст
	#шаг на будущ ст
	#шаг на прош ст


	#Перемещаться между станциями, указанными в маршруте.
	#Показывать предыдущую станцию, текущую, следующую, на основе маршрута

end
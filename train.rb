class Station
  attr_reader :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def info_train
    @trains.each do |trains|
      puts "Список поездов на станции: #{trains}"
    end
  end

  def type_train
    @qty_pass = 0
    @qty_cargo = 0
    @trains.each do |train|
      if train.type.include?('пассажирский')
        @qty_pass += 1
      elsif train.type.include?('грузовой')
        @qty_cargo += 1
      puts "На станции находятся #{@qty_pass} пассажирских поездов, и #{@qty_cargo} грузовых."
      end
    end
  end

  def send_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :list_station
  
  def initialize(start_station, end_station)
    @list_station = [start_station, end_station]
  end

  def add_station(station)
    @list_station.insert(1, station)
  end

  def remove_station(station)
    @list_station.delete(station)
    if @start_station && @end_station != @list_station.delete(station)
    end
  end

  def info_route
    puts "Список станций маршрута: #{list_station}"
  end
end

class Train
  attr_reader :number, :type, :qty_wagons, :speed, :route

  def initialize(number, type, qty_wagons)
    @number = number
    @type = type
    @qty_wagons = qty_wagons
    @speed = 0
  end
  
  def add_speed(speed)
    @speed += speed
  end

  def current_speed
    "Текущаая скорость: #{@speed}"
  end

  def reduce_speed(speed)
    @speed -= speed
  end

  def info_wagons
    "Количество вагонов: #{@qty_wagons}"
  end

  def attach_wagon
    if @speed == 0
      @qty_wagons += 1
    else
      "Поед движется, прицепка невозможна"
    end
  end
    
  def unhook_wagon
    if @speed == 0
      @qty_wagons -= 1
    else
      "Поед движется, отцепка невозможна"
    end
  end

  def take_route(route)
    @index = 0
    @route = route
    @route.list_station[@index].take_train(self)
    @current_station = @route.list_station[@index]
  end

  def move_next
    if @route.list_station[@index].array_trains.include?(self)
      @route.list_station[@index].send_train(self)
      @index += 1
      @route.list_station[@index].take_train(self)
      @current_station = @route.list_station[@index]
      if @current_station == @route.list_station[-1]
        puts "#{@current_station} - данная станция конечная"
      end
    end
  end

  def move_back
    if @route.list_station[@index].array_trains.include?(self)
      @route.list_station[@index].send_train(self)
      @index -= 1
      @route.list_station[@index].take_train(self)
      @current_station = @route.list_station[@index]
      if @current_station == @route.list_station[0]
        puts "#{@current_station} - данная станция конечная"
      end
    end
  end

  def previous_station
    if @current_station == @route.list_station[0]
      puts "Станции в маршруте закончились"
    else
      previous_station = @route.list_station[@index - 1]
      puts "Предыдущая станция: #{previous_station}"
    end
  end

  def current_station
    current_station = @route.list_station[@index]
    puts "Текущая станция: #{current_station}"
  end

  def next_station
    if @current_station == @route.list_station[-1]
      puts "Станции в маршруте закончились"
    else
      next_station = @route.list_station[@index + 1]
      puts "Следующая станция: #{next_station}"
    end
  end

station_1 = Station.new('Berlin')
station_2 = Station.new('Moscow')
station_3 = Station.new('Paris')
station_4 = Station.new('Barcelona')
station_5 = Station.new('Milan')
station_6 = Station.new('Kiev')

route_1 = Route.new(station_1, station_4)
route_1.add_station(station_3)

train_1 = Train.new(262, 'пассажирский', 15)
train_2 = Train.new(744, 'пассажирский', 8)
train_3 = Train.new(8532, 'грузовой', 85)

station_1.take_train(train_1)
station_1.take_train(train_2)
station_1.take_train(train_3)
end

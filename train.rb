class Station
  attr_reader :name, :qty_pass, :qty_cargo, :array_trains
  
  def initialize(name)
    @name = name
    @array_trains = []
  end

  def take_train(train)
    @array_trains << train
  end

  def info_train
    @array_trains.each do |trains|
      puts "Список поездов на станции: #{trains}"
    end
  end

  def type_train
    @qty_pass = 0
    @qty_cargo = 0
    @array_trains.each do |train|
      if train.type.include?('пассажирский')
        @qty_pass += 1
      elsif train.type.include?('грузовой')
        @qty_cargo += 1
      end
    end
  end

  def send_train(train)
    @array_trains.delete(train)
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
  end

  def info_route
    puts "Список станций маршрута: #{list_station}"
  end
end

class Train
  attr_reader :number, :type, :qty_wagons, :speed, :route, :current_station

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

  def take_route(itinerary)
    @index = 0
    @route = itinerary.list_station
    @route[@index].take_train(self)
    @curr_station = @route[@index]
  end

  def move_next
    if @route[@index].take_trains.include?(self)
      @route[@index].send_train(self)
      @index += 1
      @route[@index].take_train(self)
      @curr_station = @route[@index]
    end
  end

  def move_back
    if @route[@index].take_trains.include?(self)
      @route[@index].send_train(self)
      @index -= 1
      @route[@index].take_train(self)
      @curr_station = @route[@index]
    end
  end

  def previous_station
    previous_station = @route[@index]
    puts "Текущая станция: #{previous_station}"
  end


  def current_station
    current_station = @route[@index]
    puts "Текущая станция: #{current_station}"
  end

  def next_station
    next_station = @route[@index + 1]
    puts "Следующая станция: #{next_station}"
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
end

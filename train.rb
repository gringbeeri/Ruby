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
  attr_reader :number, :type, :qty_wagons, :speed, :route

  def initialize(number, type, qty_wagons)
    @number = number
    @type = type
    @qty_wagons = qty_wagons
    @speed = 0
  end

  def take_route(itinerary)
    @index = 0
    @route = itinerary.list_station
    @route[@index].take_train(self)
    @current_station = @route[@index]
  end

  def move_next
    if @route[@index].array_trains.include?(self)
      @route[@index].send_train(self)
      @index += 1
      @route[@index].take_train(self)
      @current_station = @route[@index]
      if @current_station == @route[-1]
        puts "#{@current_station} - данная станция конечная"
      end
    end
  end

  def move_back
    if @route[@index].array_trains.include?(self)
      @route[@index].send_train(self)
      @index -= 1
      @route[@index].take_train(self)
      @current_station = @route[@index]
      if @current_station == @route[0]
        puts "#{@current_station} - данная станция конечная"
      end
    end
  end

  def previous_station
    if @current_station == @route[0]
      puts "Станции в маршруте закончились"
    else
      previous_station = @route[@index - 1]
      puts "Предыдущая станция: #{previous_station}"
    end
  end

  def current_station
    current_station = @route[@index]
    puts "Текущая станция: #{current_station}"
  end

  def next_station
    if @current_station == @route[-1]
      puts "Станции в маршруте закончились"
    else
      next_station = @route[@index + 1]
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
end
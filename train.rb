class Station
  attr_reader :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    trains << train
  end

  def info_train
    puts "Список поездов на станции: "
    trains.each do |train|
      puts "Поезд с номером #{train.number}, #{train.type} тип, с количетсвом вагонов - #{train.qty_wagons}."
    end
  end

  def type_train
    qty_pass = 0
    qty_cargo = 0
    trains.each do |train|
      if train.type == 'пассажирский'
        qty_pass += 1
      elsif train.type == 'грузовой'
        qty_cargo += 1
      end
    end
    puts "На станции находятся #{qty_pass} пассажирских поездов, и #{qty_cargo} грузовых."
  end

  def send_train(train)
    trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    stations.insert(1, station)
  end

  def remove_station(station)
    if station == stations[0] || station == stations[-1]
      puts "Начальную/конечную станцию удалять нельзя"
    else
      stations.delete(station)
    end
  end

  def info_route
    puts "Список станций в маршруте: "
    stations.each do |station|
      puts station
    end
  end
end

class Train
  attr_reader :type, :qty_wagons, :route, :index, :given_speed

  def initialize(number, type, qty_wagons)
    @number = number
    @type = type
    @qty_wagons = qty_wagons
    @given_speed = 0
  end

  def add_speed(speed)
    @given_speed += speed
  end

  def current_speed
    puts "Текущаая скорость: #{given_speed}"
  end

  def reduce_speed
    @given_speed = 0
  end

  def info_wagons
    puts "Количество вагонов: #{qty_wagons}"
  end

  def attach_wagon
    if given_speed == 0
      @qty_wagons += 1
    else
      puts "Поед движется, прицепка невозможна"
    end
  end
    
  def unhook_wagon
    if given_speed == 0
      @qty_wagons -= 1
    else
      puts "Поед движется, отцепка невозможна"
    end
  end

  def take_route(route)
    @index = 0
    @route = route
    route.stations[index].take_train(self)
  end

  def move_next
    route.stations[index].send_train(self) 
    next_station.take_train(self)
  end

  def move_back
    route.stations[index].send_train(self) 
    previous_station.take_train(self)
  end

  def previous_station
    if route.stations[index].send_train(self)
      route.stations[index - 1]
    else
      route.stations[@index -= 1]
    end
  end

  def current_station
    route.stations[index]
  end

  def next_station
    if route.stations[index].trains.include?(self)
      route.stations[index + 1]
    else
      route.stations[@index += 1]
    end
  end
end

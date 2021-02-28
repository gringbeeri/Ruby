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
  attr_reader :list_station, :start_station, :end_station
  
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @list_station = [start_station, end_station]
  end

  def add_station(station)
    list_station.insert(1, station)
  end

  def remove_station(station)
    if list_station.find_index(station) > list_station.find_index(start_station) && list_station.find_index(station) < list_station.find_index(end_station)
      list_station.delete(station)
    else
      puts "Начальную и конечную станцию удалить нельзя"
    end
  end

  def info_route
    puts "Список станций в маршруте: "
    list_station.each_with_index do |station|
      puts station.name
    end
  end
end

class Train
  attr_writer :given_speed
  attr_reader :number, :type, :qty_wagons, :given_speed, :route, :index

  def initialize(number, type, qty_wagons)
    @number = number
    @type = type
    @qty_wagons = qty_wagons
    @given_speed = 0
  end
  
  def add_speed(speed)
    self.given_speed += speed
  end

  def current_speed
    puts "Текущаая скорость: #{given_speed}"
  end

  def reduce_speed(speed)
    self.given_speed -= speed
  end

  def info_wagons
    puts "Количество вагонов: #{qty_wagons}"
  end

  def attach_wagon
    if self.given_speed == 0
      qty_wagons += 1
    else
      puts "Поед движется, прицепка невозможна"
    end
  end
    
  def unhook_wagon
    if self.given_speed == 0
      qty_wagons -= 1
    else
      puts "Поед движется, отцепка невозможна"
    end
  end

  def take_route(route)
    @index = 0
    @route = route
    route.list_station[index].take_train(self)
    @current_station = route.list_station[index]
  end

  def move_next
    if route.list_station[index].array_trains.include?(self)
      route.list_station[index].send_train(self)
      index += 1
      route.list_station[index].take_train(self)
      current_station = route.list_station[index]
      if current_station == route.list_station[-1]
        puts "#{current_station} - данная станция конечная"
      end
    end
  end

  def move_back
    if route.list_station[index].array_trains.include?(self)
      route.list_station[index].send_train(self)
      index -= 1
      route.list_station[index].take_train(self)
      current_station = route.list_station[index]
      if current_station == route.list_station[0]
        puts "#{current_station} - данная станция конечная"
      end
    end
  end

  def previous_station
    if current_station == route.list_station[0]
      puts "Станции в маршруте закончились"
    else
      previous_station = route.list_station[index - 1]
      puts "Предыдущая станция: #{previous_station}"
    end
  end

  def current_station
    current_station = route.list_station[index]
    puts "Текущая станция: #{current_station}"
  end

  def next_station
    if current_station == route.list_station[-1]
      puts "Станции в маршруте закончились"
    else
      next_station = route.list_station[index + 1]
      puts "Следующая станция: #{next_station}"
    end
  end
end

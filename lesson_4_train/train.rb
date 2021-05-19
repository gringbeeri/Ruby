class Train
  include InstanceCounter
  include Brend
  include RaiseTrain
  include Valid

  attr_reader :wagons, :number

  @@trains = []

  def self.all
    @@trains.each do |train|
      train
    end
  end

  def self.all_with_info
    all.each_with_index do |train, index|
      print "#{index} - "
      train.info
    end
  end

  def self.find(number_train)
    @@trains.each do |train|
      if number_train == train.number
        puts train
      else
        puts "Данного поезда не сущестует"
      end
    end
  end

  def initialize(number)
    raise "Данный объект класса создать нельзя" if self.class.to_s == "Train"

    @number = number
    @speed = 0
    @wagons = []
    validate!
    valid?
    @@trains << self
  end

  def add_speed(speed)
    @speed += speed
  end

  def current_speed
    puts "Текущая скорость: #{self.speed}"
  end

  def reduce_speed
    @speed = 0
  end

  def unhook_wagons
    if minimal_speed?
      self.wagons.pop
    else
      puts "Поезд в движении"
    end
  end

  def info
    wagon_train = 0
    @wagons.each do |wagon|
      wagon_train += 1
    end
    puts "Поезд номер: #{self.number}, #{self.class} типа, с количеством вагонов #{wagon_train}"
  end


  def take_route(route)
    @route = route
    @index = 0
    place_first_station
  end

  def move_next_station
    current_station_route.send_train(self)
    @index += 1
    current_station_route.take_train(self)
  end

  def move_back_station
    current_station_route.send_train(self)
    @index -= 1
    current_station_route.take_train(self)
  end

  def previous_station_route
    @route.stations[@index - 1]
  end

  def current_station_route
    @route.stations[@index]
  end

  def next_station_route
    @route.stations[@index + 1]
  end

  protected

  attr_reader :speed

  def minimal_speed? # частичка метода увеличение количества вагонов. Этот метод, деталь реалазиции данного метода, и в явную он не пригодится, поэтому он был скрыт.
    self.speed.zero?
  end

  def place_first_station #данный метод следует для всех объектов подклассов, он является атоматическим, вызывать его и проверять нет необходимости.
    @route.stations[@index].take_train(self)
  end
end

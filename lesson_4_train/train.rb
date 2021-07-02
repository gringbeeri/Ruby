class Train
  include InstanceCounter
  include Brend
  include TrainValidator
  include Valid

  attr_reader :wagons, :number

  @@trains = []

  def self.trains
    @@trains
  end

  def self.all_with_info
    @@trains.each_with_index do |train, index|
      print "#{index} - "
      train.info
    end
  end

  def self.find(number_train)
    @@trains.each do |train|
      number_train == train.number ? (puts train) : (puts "Train doesn't exist")
    end
  end

  def initialize(number)
    raise "Oblect didn't create" if self.class.to_s == "Train"

    @number = number
    @speed = 0
    @wagons = []
    validate!
    @@trains << self
  end

  def add_speed(speed)
    @speed += speed
  end

  def current_speed
    puts "Current speed: #{self.speed}"
  end

  def reduce_speed
    @speed = 0
  end

  def unhook_wagons
    minimal_speed? ? self.wagons.pop : (puts "Train moves")
  end

  def info(wagon_train = 0)
    @wagons.each { |wagon| wagon_train += 1 }
    puts "Number train: #{self.number}, #{self.class} type, with qty wagons #{wagon_train}"
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

  def info_wagon
    self.wagons.each_with_index do |wagon, index|
      puts "#{index} - wagon, #{wagon}"
    end
  end

  def info_wagons(block)
    puts "Wagons: "
    block.call(self.wagons)
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

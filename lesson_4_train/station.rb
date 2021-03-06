class Station
  include InstanceCounter
  include StationValidator
  include Valid

  @@stations = []

  def self.stations
    @@stations
  end

  def self.all
    @@stations
  end

  def self.all_with_info
    @@stations.each_with_index do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
  end

  def take_train(train)
    trains << train
  end

  def info_train
    puts "Список поездов на станции: "
    trains.each { |train| train.info }
  end

  def type_train
    qty_pass = 0
    qty_cargo = 0
    trains.each do |train|
      if train.is_a? PassTrain
        qty_pass += 1
      elsif train.is_a? CargoTrain
        qty_cargo += 1
      end
    end
    puts "На станции находятся #{qty_pass} пассажирских поездов, и #{qty_cargo} грузовых."
  end

  def send_train(train)
    trains.delete(train)
  end
end

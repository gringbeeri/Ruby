class Station
  include InstanceCounter
  include StationValidator
  include Valid

  attr_reader :name, :trains

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

  def initialize(name)
    @name = name
    @trains = []
    register_instance
    validate!
    @@stations << self
  end

  def take_train(train)
    trains << train
  end

  def info_train
    puts "List trains at the station: "
    trains.each { |train| train.info }
  end

  def type_train(qty_pass=0, qty_cargo=0)
    trains.each do |train|
      qty_pass += 1 if train.is_a? PassTrain
      qty_cargo += 1 if train.is_a? CargoTrain
    end
    puts "#{qty_pass} - PassTrain, and #{qty_cargo} CargoTrain."
  end


  def send_train(train)
    trains.delete(train)
  end

  def info_trains(block)
    puts "Train on station: "
    block.call(self.trains)
  end
end

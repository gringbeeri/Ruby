module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    @@quantity = 0
    def instances
      puts "#{@@quantity} - количество экземпляров"
    end

    def register_instance
      @@quantity += 1
    end
  end

  module InstanceMethods

    protected

    def register_instance
      self.class.register_instance
    end
  end
end

class Station
  include InstanceCounter

  @@object_station = []

  def self.all
    @@object_station.each_with_index do |station, index|
      print index
      print ' - '
      puts station.name
    end
  end

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    @@object_station << self
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

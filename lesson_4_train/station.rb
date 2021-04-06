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

station_1 = Station.new("Kiev")

train_1 = PassTrain.new(26)
train_2 = PassTrain.new(588)

station_1.take_train(train_1)

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
      puts "Поезд с номером #{train.number}, #{train.class} тип, с количетсвом вагонов - #{train.wagons}."
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

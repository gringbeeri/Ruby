class PassTrain < Train

  def initialize(number)
    super
  end

  def attach_wagons(wagon)
    if minimal_speed?
      if wagon.is_a? PassWagon
        @wagons << wagon
      else
        puts "Данный вагон не подходит к этому типу поезда"
      end
    else
      puts "Поезд в движении"
    end
  end
end

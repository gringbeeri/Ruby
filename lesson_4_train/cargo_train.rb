class CargoTrain < Train

  def initialize(number)
    super
  end

  def attach_wagons(wagon)
    if minimal_speed?
      @wagons << wagon if wagon.is_a? CargoWagon
    else
      puts'Train is moving'
    end
  end
end

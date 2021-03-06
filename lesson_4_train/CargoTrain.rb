class CargoTrain < Train
  
  attr_reader :wagons_cargo, :type

  def initialize(number)
    super(number)
    @type = 'грузовой'
    @wagons_cargo = []
  end

  def type_train
    return_type
  end

  def qty_wagons
    return_wagons
  end

  def attach_wagons(wagon)
    if minimal_speed?
      if wagon.type == 'грузовой'
        @wagons_cargo << wagon
      else
        puts "Данный вагон не подходит"
      end
    else
      puts "Поезд в движении"
    end
  end

  def unhook_wagons(wagon)
    if minimal_speed?
      @wagons_cargo.delete(wagon)
    else
      puts "Поезд в движении"
    end
  end

  private 

  def return_wagons
    puts "Количество вагонов: #{@wagons_cargo}" #данный метод относится именно к поезду пассажирский ведь вагоны - пассажирские.
  end

  def minimal_speed? # частичка метода увеличение количества вагонов. Этот метод, деталь реалазиции данного метода, и в явную он не пригодится, поэтому он был скрыт. 
    self.speed.zero?
  end          

  def return_type
    puts self.type
  end
end

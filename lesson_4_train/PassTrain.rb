class PassTrain < Train
  def initialize(number, qty_wagons)
    super(number, qty_wagons)
    @type = 'пассажирский'
    @array_wagons_pass = []
  end

  def type_train
    return_type
  end

  def current_wagons
    return_wagons
  end

  def attach_wagons(wagon)
    if minimal_speed?
      attach_wagon!
    else
      puts "Поезд в движении"
    end
  end

  def unhook_wagons(wagon)
    if minimal_speed?
      unhook_wagon!
    else
      puts "Поезд в движении"
    end
  end

  private 

  attr_reader :type, :array_wagons

  def return_wagons
    "Количество вагонов: #{@array_wagons_pass}" #данный метод относится именно к поезду пассажирский ведь вагоны - пассажирские.
  end

  def minimal_speed? # частичка метода увеличение количества вагонов. Этот метод, деталь реалазиции данного метода, и в явную он не пригодится, поэтому он был скрыт. 
    self.speed.zero?
  end          

  def attach_wagon! #метод свойсветен данному классу, ведь снова касаемся отдельного вида поезда и вагона, он также часть реализациии на прямую использоваться не будет
    if wagon.type == 'пассажирский'
      @array_wagons << wagon
    else
      puts "Данный вагон не подходит"
    end
  end

  def unhook_wagon(wagon)!
    @array_wagons.delete(wagon)#анологично выше
  end

  def return_type
    puts self.type
  end
end

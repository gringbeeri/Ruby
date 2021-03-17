class Train

  attr_reader :wagons, :number

  def add_speed(speed)
    @speed += speed
  end

  def current_speed
    puts "Текущая скорость: #{self.speed}"
  end

  def reduce_speed
    @speed = 0
  end

  def take_route(route)
    @route = route
    @index = 0
    first_station
  end

  def attach_wagons(wagon)
    if minimal_speed?
      if wagon.is_a? PassWagon
        if self.is_a? PassTrain
          @wagons << wagon
        end
      elsif wagon.is_a? CargoWagon
        if self.is_a? CargoTrain
          @wagons << wagon
        end
      end
    else
      puts "Поезд в движении"
    end
  end

  def unhook_wagons
    if minimal_speed?
      if self.is_a? PassTrain
        @wagons.pop
      end
      if self.is_a? CargoTrain
        @wagons.pop
      end
    else
      puts "Поезд в движении"
    end
  end

  def move_forward
    move_next_station if train_send_station
  end

  def move_back
    move_back_station if train_send_station
  end

  def station_previous
    previous_station_route
  end

  def station_current
    current_station_route
  end

  def station_next
    next_station_route
  end

  def info
    puts "Поезд номер: #{self.number}, с количеством вагонов #{self.wagons}" #данный метод относится именно к поезду пассажирский ведь вагоны - пассажирские.
  end

  protected

  attr_reader :speed

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end

  def minimal_speed? # частичка метода увеличение количества вагонов. Этот метод, деталь реалазиции данного метода, и в явную он не пригодится, поэтому он был скрыт. 
    self.speed.zero?
  end

  def first_station #данный метод следует для всех объектов подклассов, он является атоматическим, вызывать его и проверять нет необходимости.
    @route.stations[@index].take_train(self)
  end

  def train_send_station #данный метод ,также скрыт, ведь это также часть реализации, которую не должен видеть пользователь. Он ведь только проверяет где сейчас поезд.
    current_station_route.send_train(self)
  end

  def move_next_station #методы анологичны. Все реализация. Мы упростили. Мы создали один метод - текущая станция, от которой он будет двигаться.
    next_station_route.take_train(self)
    @index += 1
  end

  def move_back_station #анологично выше
    previous_station_route.take_train(self)
    @index -= 1
  end

  def previous_station_route #метод также возможен в использовании подклассов. Ведь все поезда могут запросить предыдущую/текущую/следующую станцию. Но это также часть реализации, которая не нужна пользователю.
    puts @route.stations[@index - 1].name
  end

  def current_station_route
    puts @route.stations[@index].name
  end

  def next_station_route
    puts @route.stations[@index + 1].name
  end
end

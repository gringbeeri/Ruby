class Train
  def initialize(number)
    @number = number
    @speed = 0
  end

  def add_speed(speed)
    @speed += speed
  end

  def current_speed
    return_speed
  end

  def reduce_speed(speed)
    @speed -= speed
  end

  def take_route(route)
    @route = route
    if @route == route
      first_station_route!
    end
  end

  def move_next
    next_station! if train_current_station?
  end

  def move_back
    back_station! if train_current_station?
  end

  def station_previous
    station_previous!

  def station_current
    station_current!

  def station_next
    station_next!

  protected

  attr_reader :speed, :qty_wagons

  def return_speed
    "Текущая скорость: #{self.speed}" # данные методы, установлены в protected, так как они используются в подклассах, а также, метод должен возвращать скорость, а не напрямую вызывая его у экземпляра
  end

  def first_station_route! #данный метод следует для всех объектов подклассов, он является атоматическим, вызывать его и проверять нет необходимости.
    @index = 0
    @route.list_station[@index].take_train(self)
    @current_station = @route.list_station[@index]
  end

  def train_current_station? #данный метод ,также скрыт, ведь это также часть реализации, которую не должен видеть пользователь. Он ведь только проверяет где сейчас поезд.
    if @route.list_station[@index].array_trains.include?(self)
      @route.list_station[@index].send_train(self)
    end
  end

  def next_station! #методы анологичны. Все реализация. Мы упростили. Мы создали один метод - текущая станция, от которой он будет двигаться.
    @index += 1
    @route.list_station[@index].take_train(self)
    @current_station = @route.list_station[@index]
    if @current_station == @route.list_station[-1]
      puts "#{@current_station} - данная станция конечная"
      end
    end
  end

  def back_station! #анологично выше
    @index -= 1
      @route.list_station[@index].take_train(self)
      @current_station = @route.list_station[@index]
      if @current_station == @route.list_station[0]
        puts "#{@current_station} - данная станция конечная"
      end
    end
  end

  def station_previous! #метод также возможен в использовании подклассов. Ведь все поезда могут запросить предыдущую/текущую/следующую станцию. Но это также часть реализации, которая не нужна пользователю.
    if @current_station == @route.list_station[0]
      puts "Станции в маршруте закончились"
    else
      previous_station = @route.list_station[@index - 1]
      puts "Предыдущая станция: #{previous_station}"
    end
  end

  def current_station
    current_station = @route.list_station[@index]
    puts "Текущая станция: #{current_station}"
  end

  def next_station
    if @current_station == @route.list_station[-1]
      puts "Станции в маршруте закончились"
    else
      next_station = @route.list_station[@index + 1]
      puts "Следующая станция: #{next_station}"
    end
  end
end

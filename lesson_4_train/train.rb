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

  def reduce_speed
    @speed = 0
  end

  def take_route(route)
    @route = route
    first_station_route!
  end

  def move_next
    move_next_station! if train_current_station?
  end

  def move_back
    move_back_station! if train_current_station?
  end

  def station_previous?
    station_previous!

  def station_current
    station_current!

  def station_next?
    station_next!

  protected

  attr_reader :speed, :qty_wagons

  def return_speed
    "Текущая скорость: #{self.speed}" # данные методы, установлены в protected, так как они используются в подклассах, а также, метод должен возвращать скорость, а не напрямую вызывая его у экземпляра
  end

  def first_station_route! #данный метод следует для всех объектов подклассов, он является атоматическим, вызывать его и проверять нет необходимости.
    @index = 0
    @route.list_station[index].take_train(self)
  end

  def train_current_station_send? #данный метод ,также скрыт, ведь это также часть реализации, которую не должен видеть пользователь. Он ведь только проверяет где сейчас поезд.
    current_station!.send_train(self)
  end

  def move_next_station! #методы анологичны. Все реализация. Мы упростили. Мы создали один метод - текущая станция, от которой он будет двигаться.
    next_station!.take_train(self)
    @index += 1
  end

  def move_back_station! #анологично выше
    next_station!.take_train(self)
    @index -= 1
  end

  def station_previous! #метод также возможен в использовании подклассов. Ведь все поезда могут запросить предыдущую/текущую/следующую станцию. Но это также часть реализации, которая не нужна пользователю.
    @route.list_station[index - 1]
  end

  def current_station!
    @route.list_station[index]
  end

  def next_station!
    @route.list_station[index + 1]
  end
end

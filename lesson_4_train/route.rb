class Route
  include InstanceCounter
  include RaiseRoute
  include Valid

  @@routes = []

  def self.all
    @@routes.each do |route|
      route
    end
  end

  def self.all_with_info
    all.each_with_index do |route, index|
      puts "#{index} - маршрут. Начальная станция: #{route[0].name}. Конечная станция: #{route[-1].name}."
    end
  end

  attr_reader :stations, :start_station, :end_station

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    @@routes << @stations
  end

  def add_station(station)
    stations.insert(1, station)
  end

  def remove_station(station)
    if station == stations[0] || station == stations[-1]
      puts "Начальную/конечную станцию удалять нельзя"
    else
      stations.delete(station)
    end
  end

  def info_route
    puts "Список станций в маршруте: "
    stations.each { |station| puts station.name }
  end
end

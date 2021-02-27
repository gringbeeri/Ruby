class Route
  attr_reader :list_station
    
  def initialize(start_station, end_station)
    @list_station = [start_station, end_station]
  end
  
  def add_station(station)
    @list_station.insert(1, station)
  end
  
  def remove_station(station)
    @list_station.delete(station)
    if @start_station && @end_station != @list_station.delete(station)
    end
  end
  
  def info_route
    puts "Список станций маршрута: #{list_station}"
  end
end

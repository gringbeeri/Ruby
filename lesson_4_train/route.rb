# frozen_string_literal: true

class Route
  include InstanceCounter
  include RouteValidator
  # include Valid

  attr_reader :stations, :start_station, :end_station

  @routes = []

  class << self
    attr_accessor :routes
  end

  def self.all_routes
    @routes
  end

  def self.all
    @routes
  end

  def self.all_with_info
    @routes.each_with_index do |route, index|
      puts "#{index} - route. Start - station: #{route.stations[0].name} - End - station: #{route.stations[-1].name}."
    end
  end

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    # validate!
    register_instance
    self.class.routes << self
  end

  def add_station(station)
    stations.insert(1, station)
  end

  def remove_station(station)
    if station == stations[0] || station == stations[-1]
      puts "Station won't be deleted"
    else
      stations.delete(station)
    end
  end

  def info_route
    puts 'List of stations in the route: '
    stations.each { |station| puts station.name }
  end
end

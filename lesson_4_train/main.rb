require_relative './station'
require_relative './route'
require_relative './train'
require_relative './pass_train'
require_relative './cargo_train'
require_relative './wagon'
require_relative './pass_wagon'
require_relative './cargo_wagon'

class Railway

  attr_reader :trains, :routes, :stations, :wagons

  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  def menu
    loop do
      puts "Добро пожаловать в железную дорогу!"
      puts "Введите 1 - для создания станции"
      puts "Введите 2 - для создания поезда"
      puts "Введите 3 - для создания маршрута и управления станций в нем(добавлять/удалять)"
      puts "Введите 4 - для назначения маршрута поезду"
      puts "Введите 5 - для добавления вагона к поезду"
      puts "Введите 6 - для отцепления вагона от поезда"
      puts "Введите 7 - для перемещение поезда по маршруту вперед и назад"
      puts "Введите 8 - для просмотра списка станций и списка поездов на станции"
      puts "Введите 9 - для выхода из программы"
      print "Ваш ответ: "
      answer = gets.to_i

      case answer
      when 1
        print "Введите название станции: "
        name_station = gets.chomp
        @stations << Station.new(name_station)

      when 2
        puts "Введите 1 - для создания пассажирского поезда"
        puts "Введите 2 - для создания грузового поезда"
        print "Ваш ответ: "
        answer_train = gets.to_i
        case answer_train
        when 1
          print "Введите номер пассажирского поезда: "
          pass_train = gets.to_i
          @trains << PassTrain.new(pass_train)
        when 2
          print "Введите номер грузового поезда: "
          cargo_train = gets.to_i
          @trains << CargoTrain.new(cargo_train)
        end

      when 3
        puts "Введите 1 - для назначения начальной и конечной станции"
        puts "Введите 2 - для добавления/удаление промежуточной станции"
        print "Введите ваш ответ: "
        route_answer = gets.to_i
        puts "Список станций: "
        info_stations
        case route_answer
        when 1
          print "Введите номер начальной станции: "
          start_station = @stations[gets.to_i]
          print "Введите номер конечной станции: "
          end_station = @stations[gets.to_i]
          @routes << Route.new(start_station, end_station)
        when 2
          puts "Выберете маршрут в который необходимо добавить/удалить промежуточную станцию: "
          info_routes
          print "Введите номер маршрута: "
          answer_route = gets.to_i
          puts "Введите 1 - для добавление промежуточной станции"
          puts "Введите 2 - для удаление промежуточной станции"
          print "Ваш ответ: "
          answer_station = gets.to_i
          case answer_station
          when 1
            print "Введите номер станции которую добавить: "
            station = @stations[gets.to_i]
            @routes[answer_route].add_station(station)
          when 2
            print "Введите номер станции которую удалить: "
            station = @stations[gets.to_i]
            @routes[answer_route].remove_station(station)
          end
        end

      when 4
        puts "Введите цифру, какому поезду вы хотите присвоить маршрут: "
        info_trains
        print "Ваш ответ: "
        answer_train = gets.to_i
        puts "Какой маршрут присвоить поезду: "
        info_routes
        print "Ваш ответ: "
        answer_route = gets.to_i
        route_train = @routes[answer_route]
        @trains[answer_train].take_route(route_train)

      when 5
        puts "Введите 1 - для добавления вагона к пассажирскому поезду"
        puts "Введите 2 - для добавления вагона к грузовому поезду"
        print "Ваш ответ: "
        answer_wagon = gets.to_i
        case answer_wagon
        when 1
          puts "К какому пассажирскому поезду вы хотите прицепить вагон: "
          info_pass_train
          print "Ваш ответ: "
          answer_trains = gets.to_i
          wagon = PassWagon.new
          @trains[answer_trains].attach_wagons(wagon)
        when 2
          puts "К какому грузовому поезду вы хотите прицепить вагон: "
          info_cargo_train
          print "Ваш ответ: "
          answer_trains = gets.to_i
          wagon = CargoWagon.new
          @trains[answer_trains].attach_wagons(wagon)
        end

      when 6
        puts "Введите 1 - для отцепления вагона от пассажирского поезду"
        puts "Введите 2 - для отцепления вагона от грузового поезду"
        print "Ваш ответ: "
        answer_wagon = gets.to_i
        case answer_wagon
        when 1
          puts "У какого пассажирского поезда вы хотите отцепить вагон: "
          info_pass_train
          print "Ваш ответ: "
          answer_trains = gets.to_i
          @trains[answer_trains].unhook_wagons
        when 2
          puts "У какого грузового поезда вы хотите отцепить вагон: "
          info_cargo_train
          print "Ваш ответ: "
          answer_trains = gets.to_i
          @trains[answer_trains].unhook_wagons
        end

      when 7
        puts "Выберите поезд "
        info_trains
        print "Ваш ответ: "
        answer_train = gets.to_i
        puts "Введите 1 - для передвижения вперед"
        puts "Введите 2 - для передвижения назад"
        puts "Введите 3 - для инфрмации о предыдущей/текущей/следующей станции"
        print "Ваш ответ: "
        answer = gets.to_i
        case answer
        when 1
          @trains[answer_train].move_forward
        when 2
          @trains[answer_train].move_back
        when 3
          puts "Введите 1 - для информации о предыдущей станции"
          puts "Введите 2 - для информации о текущей станции"
          puts "Введите 3 - для информации о следующей станции"
          print "Ваш ответ: "
          answer_station = gets.to_i
          case answer_station
          when 1
            @trains[answer_train].station_previous
          when 2
            @trains[answer_train].station_current
          when 3
            @trains[answer_train].station_next
          end
        end

      when 8
        puts "Список станций: "
        info_stations
        print "Введите цифру станции, для просмотра на ней списка поездов: "
        answer_station = gets.to_i
        @stations[answer_station].info_train
      else
        break answer
        puts "Вы вышли из программы"
      end
    end
  end

  private

  def info_stations
    @stations.each_with_index do |station, index|
      print index
      print ' - '
      puts station.name
    end
  end

  def info_routes
    @routes.each_with_index do |route, index|
      print index
      print ' - '
      puts "Маршрут: #{route}. Начальная станция: #{route.stations[0].name} - Конечная станция:  #{route.stations[-1].name}."
    end
  end

  def info_pass_train
    @trains.each_with_index do |train, index|
      if train.class == PassTrain
        print index
        print " - "
      train.info
      end
    end
  end

  def info_cargo_train
    @trains.each_with_index do |train, index|
      if train.class == CargoTrain
        print index
        print " - "
      train.info
      end
    end
  end

  def info_trains
    @trains.each_with_index do |train, index|
      print index
      print ' - '
    train.info
    end
  end
end

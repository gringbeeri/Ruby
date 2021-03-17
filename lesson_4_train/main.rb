require_relative 'Railway_project.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'PassTrain.rb'
require_relative 'CargoTrain.rb'
require_relative 'wagon.rb'
require_relative 'PassWagon.rb'
require_relative 'CargoWagon.rb'

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
      puts "Введите 1 - для создания станции" #+
      puts "Введите 2 - для создания поезда" #+
      puts "Введите 3 - для создания маршрута и управления станций в нем(добавлять/удалять)" # + 
      puts "Введите 4 - для назначения маршрута поезду" # + 
      puts "Введите 5 - для добавления вагона к поезду" # +
      puts "Введите 6 - для отцепления вагона от поезда" # + 
      puts "Введите 7 - для перемещение поезда по маршруту вперед и назад" #
      puts "Введите 8 - для просмотра списка станций и списка поездов на станции" # + 
      puts "Введите 9 - для выхода из программы" # + 
      print "Ваш ответ: "
      answer = gets.to_i
    
      case answer 
      when 1
        print "Введите название станции: "
        name_station = gets.chomp
        station = Station.new(name_station)
        @stations << station

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
        puts "Введите 2 - для добавления промежуточной/удаление станции"
        print "Введите ваш ответ: "
        route_answer = gets.to_i
        puts "Список станций: "
        @stations.each_with_index do |station, index|
          print index
          print ' - '
          puts station.name
        end
        case route_answer
        when 1
          print "Введите номер начальной станции: " 
          start_station = @stations[gets.to_i]
          print "Введите номер конечной станции: " 
          end_station = @stations[gets.to_i]
          route = Route.new(start_station, end_station)
          @routes << route
        when 2
          puts "Выберете маршрут в который необходимо добавить/удалить промежуточную станцию: "
          @routes.each_with_index do |route, index|
            print index
            print ' - '
            puts "Маршрут: #{route}. Начальная станция: #{route.stations[0].name} - Конечная станция:  #{route.stations[-1].name}."
          end
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
            puts "Список станций: "
          when 2 
            print "Введите номер станции которую удалить: "
            station = @stations[gets.to_i]
            @routes[answer_route].delete(station)
            puts "Список станций: "
          end
        end

      when 4
        puts "Введите цифру, какому поезду вы хотите присвоить маршрут: " 
        @trains.each_with_index do |train, index|
          print index
          print ' - '
          puts "Поезд с номером #{train.number}, типа #{train.class} с количеством вагонов"
        end
        print "Ваш ответ: "
        answer_train = gets.to_i
        puts "Какой маршрут присвоить поезду: "
        @routes.each_with_index do |route, index|
          print index
          print ' - '
          puts "Маршрут: #{route}. Начальная станция: #{route.stations[0].name} - Конечная станция:  #{route.stations[-1].name}."
        end
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
          @trains.each_with_index do |train, index|
            if train.class == PassTrain
              print index
              print " - "
            train.info
            end
          end
          print "Ваш ответ: "
          answer_trains = gets.to_i
          wagon = PassWagon.new
          @trains[answer_trains].attach_wagons(wagon)
        when 2
          puts "К какому грузовому поезду вы хотите прицепить вагон: "
          @trains.each_with_index do |train, index|
            if train.class == CargoTrain
              print index
              print " - "
            train.info
            end
          end
          print "Ваш ответ: "
          answer_trains = gets.to_i
          wagon = CargoWagon.new
          @trains[answer_trains].attach_wagons(wagon)
        end
      when 6 
         puts "Введите 1 - для отцепления вагона к пассажирскому поезду"
        puts "Введите 2 - для отцепления вагона к грузовому поезду"
        print "Ваш ответ: "
        answer_wagon = gets.to_i
        case answer_wagon
        when 1
          puts "У какого пассажирского поезда вы хотите отцепить вагон: "
          @trains.each_with_index do |train, index|
            if train.class == PassTrain
              print index
              print " - "
            train.info
            end
          end
          print "Ваш ответ: "
          answer_trains = gets.to_i
          @trains[answer_trains].unhook_wagons
        when 2
          puts "У какого грузового поезда вы хотите отцепить вагон: "
          @trains.each_with_index do |train, index|
            if train.class == CargoTrain
              print index
              print " - "
            train.info
            end
          end
          print "Ваш ответ: "
          answer_trains = gets.to_i
          @trains[answer_trains].unhook_wagons
        end

      when 7 
        puts "Выберите "
        @trains.each_with_index do |train, index|
          print index
          print " - "
        train.info
        end
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
        @stations.each_with_index do |station, index|
          print index
          print ' - '
          puts "Станция: #{station.name}"
        end
        print "Введите цифру станции, для просмотра на ней станции: "
        answer_station = gets.to_i
        @stations[answer_station].info_train
      else
        break answer 
        puts "Вы вышли из программы"
      end
    end
  end
end

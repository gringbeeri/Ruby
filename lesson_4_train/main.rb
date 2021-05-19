require_relative './module_brend'
require_relative './module_instance_counter'
require_relative './module_raise_route'
require_relative './module_raise_station'
require_relative './module_raise_train'
require_relative './module_valid'
require_relative './station'
require_relative './route'
require_relative './train'
require_relative './pass_train'
require_relative './cargo_train'
require_relative './wagon'
require_relative './pass_wagon'
require_relative './cargo_wagon'

class Railway

  attr_reader :trains, :routes, :stations

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
      case gets.to_i

      when 1
        print "Введите название станции: "
        begin
          @stations << Station.new(gets.chomp)
        rescue TypeError => e
          puts e.message
          puts "Попробуйте создать станцию еще раз"
        end

      when 2
        puts "Введите 1 - для создания пассажирского поезда"
        puts "Введите 2 - для создания грузового поезда"
        print "Ваш ответ: "
        case gets.to_i
        when 1
          print "Введите номер пассажирского поезда: "
          begin
            @trains << PassTrain.new(gets.to_i)
            puts "Объект класса поезд создан"
          rescue RuntimeError => e
            puts e.message
            puts 'Попробуйте создать пассажирский-поезд еще раз'
          end
        when 2
          print "Введите номер грузового поезда: "
          begin
            @trains << CargoTrain.new(gets.to_i)
            puts "Объект класса поезд создан"
          rescue RuntimeError => e
            puts e.message
            puts 'Попробуйте создать грузовой-поезд еще раз'
          end
        end

      when 3
        puts "Введите 1 - для назначения начальной и конечной станции"
        puts "Введите 2 - для добавления/удаление промежуточной станции"
        print "Введите ваш ответ: "
        case gets.to_i
        when 1
          puts "Список станций: "
          Station.all_with_info
          print "Введите номер начальной станции: "
          start_station = @stations[gets.to_i]
          print "Введите номер конечной станции: "
          end_station = @stations[gets.to_i]
          begin
            @routes << Route.new(start_station, end_station)
            puts 'Объект класса передан верно'
          rescue RuntimeError => e
            puts e.message
            puts 'Данные переданы не верно, объекты не принадлежат классу Станция'
          end
        when 2
          puts "Выберете маршрут в который необходимо добавить/удалить промежуточную станцию: "
          Route.all_with_info
          print "Введите номер маршрута: "
          answer_route = gets.to_i
          puts "Введите 1 - для добавление промежуточной станции"
          puts "Введите 2 - для удаление промежуточной станции"
          print "Ваш ответ: "
          case gets.to_i
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
        Train.all_with_info
        print "Ваш ответ: "
        answer_train = gets.to_i
        puts "Какой маршрут присвоить поезду: "
        Route.all_with_info
        print "Ваш ответ: "
        route_train = @routes[gets.to_i]
        @trains[answer_train].take_route(route_train)

      when 5
        puts "Введите 1 - для добавления вагона к пассажирскому поезду"
        puts "Введите 2 - для добавления вагона к грузовому поезду"
        print "Ваш ответ: "
        case gets.to_i
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
        case gets.to_i
        when 1
          puts "У какого пассажирского поезда вы хотите отцепить вагон: "
          info_pass_train
          print "Ваш ответ: "
          @trains[gets.to_i].unhook_wagons
        when 2
          puts "У какого грузового поезда вы хотите отцепить вагон: "
          info_cargo_train
          print "Ваш ответ: "
          @trains[gets.to_i].unhook_wagons
        end

      when 7
        puts "Выберите поезд "
        Train.all_with_info
        print "Ваш ответ: "
        answer_train = gets.to_i
        puts "Введите 1 - для передвижения вперед"
        puts "Введите 2 - для передвижения назад"
        puts "Введите 3 - для инфрмации о предыдущей/текущей/следующей станции"
        print "Ваш ответ: "
        case gets.to_i
        when 1
          @trains[answer_train].move_next_station
        when 2
          @trains[answer_train].move_back_station
        when 3
          puts "Введите 1 - для информации о предыдущей станции"
          puts "Введите 2 - для информации о текущей станции"
          puts "Введите 3 - для информации о следующей станции"
          print "Ваш ответ: "
          answer_station = gets.to_i
          case answer_station
          when 1
            @trains[answer_train].previous_station_route
          when 2
            @trains[answer_train].current_station_route
          when 3
            @trains[answer_train].next_station_route
          end
        end

      when 8
        puts "Список станций: "
        Station.all_with_info
        print "Введите цифру станции, для просмотра на ней списка поездов: "
        @stations[gets.to_i].info_train
      else
        break answer
        puts "Вы вышли из программы"
      end
    end
  end

  private

  def info_pass_train
    @trains.each_with_index do |train, index|
      if train.class == PassTrain
        print "#{index} - "
        train.info
      end
    end
  end

  def info_cargo_train
    @trains.each_with_index do |train, index|
      if train.class == CargoTrain
        print "#{index} - "
        train.info
      end
    end
  end
end

Railway.new.menu

# frozen_string_literal: true

# Railway
class Railway
  def self.call
    loop do
      puts 'Добро пожаловать в железную дорогу!'
      puts 'Введите 1 - для создания станции'
      puts 'Введите 2 - для создания поезда'
      puts 'Введите 3 - для создания маршрута и управления станций в нем(добавлять/удалять)'
      puts 'Введите 4 - для назначения маршрута поезду'
      puts 'Введите 5 - для добавления вагона к поезду'
      puts 'Введите 6 - для отцепления вагона от поезда'
      puts 'Введите 7 - для перемещение поезда по маршруту вперед и назад'
      puts 'Введите 8 - для просмотра списка станций, списка поездов на станции и списка вагонов у поезда'
      puts 'Введите 9 - для выхода из программы'
      print 'Ваш ответ: '
      case gets.to_i

      when 1
        print 'Введите название станции: '
        begin
          Station.new(gets.chomp)
        rescue TypeError => e
          puts e.message
          puts 'Попробуйте создать станцию еще раз'
        end

      when 2
        puts 'Введите 1 - для создания пассажирского поезда'
        puts 'Введите 2 - для создания грузового поезда'
        print 'Ваш ответ: '
        case gets.to_i
        when 1
          print 'Введите номер пассажирского поезда: '
          begin
            PassTrain.new(gets.chomp)
            puts 'Объект класса поезд создан'
          rescue RuntimeError => e
            puts e.message
            puts 'Попробуйте создать пассажирский-поезд еще раз.'
          end
        when 2
          print 'Введите номер грузового поезда: '
          begin
            CargoTrain.new(gets.chomp)
            puts 'Объект класса поезд создан'
          rescue RuntimeError => e
            puts e.message
            puts 'Попробуйте создать грузовой-поезд еще раз.'
          end
        end

      when 3
        puts 'Введите 1 - для назначения начальной и конечной станции'
        puts 'Введите 2 - для добавления/удаление промежуточной станции'
        print 'Введите ваш ответ: '
        case gets.to_i
        when 1
          puts 'Список станций: '
          Station.all_with_info
          print 'Введите номер начальной станции: '
          start_station = Station.stations[gets.to_i]
          print 'Введите номер конечной станции: '
          end_station = Station.stations[gets.to_i]
          begin
            Route.new(start_station, end_station)
            puts 'Объект класса передан верно.'
          rescue RuntimeError => e
            puts e.message
            puts 'Данные переданы не верно, объект класса не принадлежат классу Станция.'
          end
        when 2
          puts 'Выберете маршрут в который необходимо добавить/удалить промежуточную станцию: '
          Route.all_with_info
          print 'Введите номер маршрута: '
          answer_route = gets.to_i
          puts 'Введите 1 - для добавление промежуточной станции'
          puts 'Введите 2 - для удаление промежуточной станции'
          print 'Ваш ответ: '
          case gets.to_i
          when 1
            print 'Введите номер станции которую добавить: '
            station = Station.stations[gets.to_i]
            Route.routes[answer_route].add_station(station)
          when 2
            print 'Введите номер станции которую удалить: '
            station = Station.stations[gets.to_i]
            Route.routes[answer_route].remove_station(station)
          end
        end

      when 4
        puts 'Введите цифру, какому поезду вы хотите присвоить маршрут: '
        Train.all_with_info
        print 'Ваш ответ: '
        answer_train = gets.to_i
        puts 'Какой маршрут присвоить поезду: '
        Route.all_with_info
        print 'Ваш ответ: '
        route_train = Route.routes[gets.to_i]
        Train.trains[answer_train].take_route(route_train)

      when 5
        puts 'Введите 1 - для добавления вагона к пассажирскому поезду'
        puts 'Введите 2 - для добавления вагона к грузовому поезду'
        puts 'Введите 3 - для заполянемости места или объема в вагоне'
        print 'Ваш ответ: '
        case gets.to_i
        when 1
          puts 'К какому пассажирскому поезду вы хотите прицепить вагон: '
          info_pass_train
          print 'Ваш ответ: '
          answer_trains = gets.to_i
          print 'Выберите количество мест в вагоне: '
          wagon = PassWagon.new(gets.to_i)
          Train.trains[answer_trains].attach_wagons(wagon)
        when 2
          puts 'К какому грузовому поезду вы хотите прицепить вагон: '
          info_cargo_train
          print 'Ваш ответ: '
          answer_trains = gets.to_i
          print 'Введите заполняемый объем вагона: '
          wagon = CargoWagon.new(gets.to_i)
          Train.trains[answer_trains].attach_wagons(wagon)
        when 3
          puts 'Введите 1 - для заполняемости пассажирского вагона и проверки мест'
          puts 'Введите 2 - для заполняемости грузового вагона и проверки объема'
          print 'Ваш ответ: '
          case gets.to_i
          when 1
            puts 'Какой пассажирский поезд вы хотите заполнить местами и какой вагон: '
            info_pass_train
            print 'Ваш ответ: '
            pass_train = gets.to_i
            Train.trains[pass_train].info_wagon
            print 'Выберите вагон: '
            answer_wagon = gets.to_i
            Train.trains[pass_train].wagons[answer_wagon].busy_seats
            puts 'Количество свободных мест: '
            Train.trains[pass_train].wagons[answer_wagon].info_free_seats
          when 2
            puts 'Какой грузовой поезд вы хотите заполнить объемом и какой вагон: '
            info_cargo_train
            print 'Ваш ответ: '
            cargo_train = gets.to_i
            Train.trains[cargo_train].info_wagon
            print 'Выберите вагон: '
            answer_wagon = gets.to_i
            print 'Передайте нужный объем: '
            Train.trains[cargo_train].wagons[answer_wagon].fill_valume(gets.to_i)
            puts 'Количество свободного объема: '
            Train.trains[cargo_train].wagons[answer_wagon].info_general_valume
          end
        end

      when 6
        puts 'Введите 1 - для отцепления вагона от пассажирского поезду'
        puts 'Введите 2 - для отцепления вагона от грузового поезду'
        print 'Ваш ответ: '
        case gets.to_i
        when 1
          puts 'У какого пассажирского поезда вы хотите отцепить вагон: '
          info_pass_train
          print 'Ваш ответ: '
          Train.trains[gets.to_i].unhook_wagons
        when 2
          puts 'У какого грузового поезда вы хотите отцепить вагон: '
          info_cargo_train
          print 'Ваш ответ: '
          Train.trains[gets.to_i].unhook_wagons
        end

      when 7
        puts 'Выберите поезд '
        Train.all_with_info
        print 'Ваш ответ: '
        answer_train = gets.to_i
        puts 'Введите 1 - для передвижения вперед'
        puts 'Введите 2 - для передвижения назад'
        puts 'Введите 3 - для инфрмации о предыдущей/текущей/следующей станции'
        print 'Ваш ответ: '
        case gets.to_i
        when 1
          Train.trains[answer_train].move_next_station
        when 2
          Train.trains[answer_train].move_back_station
        when 3
          puts 'Введите 1 - для информации о предыдущей станции'
          puts 'Введите 2 - для информации о текущей станции'
          puts 'Введите 3 - для информации о следующей станции'
          print 'Ваш ответ: '
          answer_station = gets.to_i
          case answer_station
          when 1
            Train.trains[answer_train].previous_station_route
          when 2
            Train.trains[answer_train].current_station_route
          when 3
            Train.trains[answer_train].next_station_route
          end
        end

      when 8
        puts 'Введите 1 - для просмотра станции и списка поездов на ней'
        puts 'Введите 2 - для просмотра списка поездов и списка вагонов у них'
        print 'Ваш ответ: '
        case gets.to_i
        when 1
          puts 'Список станций: '
          Station.all_with_info
          print 'Введите цифру станции, для просмотра на ней списка поездов: '
          answer_station = gets.to_i
          Station.stations[answer_station].info_trains { |trains| trains }
        when 2
          puts 'Список поездов'
          Train.all_with_info
          print 'Выберите поезд: '
          answer_train = gets.to_i
          Train.trains[answer_train].info_wagons { |wagons| wagons }
        end
      else
        puts 'Вы вышли из программы'
        break answer
      end
    end
  end

  def self.info_pass_train
    Train.trains.each_with_index do |train, index|
      if train.is_a? PassTrain
        print "#{index} - "
        train.info
      end
    end
  end

  def self.info_cargo_train
    Train.trains.each_with_index do |train, index|
      if train.is_a? CargoTrain
        print "#{index} - "
        train.info
      end
    end
  end
end

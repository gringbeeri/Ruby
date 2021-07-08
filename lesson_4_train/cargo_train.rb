# frozen_string_literal: true

# HeirClass
class CargoTrain < Train
  def attach_wagons(wagon)
    if minimal_speed?
      @wagons << wagon if wagon.is_a? CargoWagon
    else
      puts 'Train is moving'
    end
  end

  def info_wagons(qty = 0, &block)
    wagons.each do |wagon|
      qty += 1
      puts "Number #{qty}, type: #{wagon.class}, #{wagon.info_fill} fill volume, #{wagon.info_volume} free volume."
      block.call(wagon)
    end
  end
end

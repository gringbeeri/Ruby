# frozen_string_literal: true

# HeirClass
class PassTrain < Train
  def attach_wagons(wagon)
    if minimal_speed?
      @wagons << wagon if wagon.is_a? PassWagon
    else
      puts('Train is moving')
    end
  end

  def info_wagons(qty = 0, &block)
    wagons.each do |wagon|
      qty += 1
      puts "Number #{qty}, type: #{wagon.class}, #{wagon.info_busy} busy seat, #{wagon.info_free} free seat."
      block.call(wagon)
    end
  end
end

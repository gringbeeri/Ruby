class CargoWagon < Wagon
  attr_reader :fill_volume

  def initialize(volume)
    super()

    raise "Data transfer don't right" unless volume.is_a? Integer
    raise "Data transfer don't right" if volume < 1

    @volume = volume
    @fill_volume = 0
  end

  def fill(volume)
    @fill_volume += volume unless @volume < 1
  end

  def info_fill
    @fill_volume
  end

  def info_volume
    @volume - @fill_volume unless @fill_volume > @volume
  end
end

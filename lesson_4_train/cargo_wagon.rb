class CargoWagon < Wagon

  attr_reader :fill_valume

  def initialize(general_valume)
    @general_valume = general_valume
    @fill_valume = 0
  end

  def fill_valume(valume)
    @fill_valume += valume
    @general_valume = @general_valume - valume
  end

  def info_fill_valume
    @fill_valume
  end

  def info_general_valume
    @general_valume
  end
end

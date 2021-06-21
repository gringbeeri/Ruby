class CargoWagon < Wagon

  def initialize(general_valume)
    @general_valume = general_valume
    @fill_valume = 0
  end

  def fill_valume(fill_valume)
    @fill_valume += fill_valume
  end

  def busy_valume
    @fill_valume
  end

  def free_valume
    @general_valume -= @fill_valume
    @general_valume
  end
end

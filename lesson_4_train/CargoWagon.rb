class CargoWagon
  attr_reader :type
  def initialize 
    @type = 'грузовой'
  end

  def type_train
    puts @type
  end
end

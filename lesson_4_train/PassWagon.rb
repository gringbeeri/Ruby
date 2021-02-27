class PassWagon
  attr_reader :type
  def initialize 
    @type = 'пассажирский'
  end

  def type_train
    puts @type
  end
end

module TrainValidator
  def validate!
    raise RuntimeError, "Class object didn't create." if number !~ REGISTER_NUMBER
  end

  protected

  REGISTER_NUMBER = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i
end

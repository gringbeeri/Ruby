module TrainValidator
  def validate!
    raise RuntimeError, 'Объект класса не создан, не соблюдены условия регистра.' if number !~ REGISTER_NUMBER
  end

  protected

  REGISTER_NUMBER = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i
end

module TrainValidator
  def validate!
    raise RuntimeError, 'Объект класса не создан, не соблюдены условия регистра.' if number !~ REGISTER_NUMBER
  end

  protected

  REGISTER_NUMBER = /^.{3}[-]?.{2}$/
end

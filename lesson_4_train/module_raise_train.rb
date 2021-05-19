module RaiseTrain
  def validate!
    raise RuntimeError, 'Объект класса не создан, не соблюдены условия регистра.' if number !~ REGISTER_NUMBER
  end

  protected

  REGISTER_NUMBER = /^.{3}-?{1}.{3}$/
end

module RaiseStation
  def validate!
    raise TypeError, 'Данный объект не создан! Не соблюдены условия обязательного регистра.' if name !~ REGISTER_NAME
  end

  protected

  REGISTER_NAME = /^.{2}+/
end

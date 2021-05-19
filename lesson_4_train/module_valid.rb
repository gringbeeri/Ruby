module Valid
  def valid?
    validate!
    puts 'Данные переданы верно'
  rescue
    puts 'Данные неверны'
  end
end

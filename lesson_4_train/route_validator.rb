module RouteValidator
  def validate!
    raise RuntimeError, "Объект класса не создан, не соответсвуют данные." unless stations[0].is_a? Station
    raise RuntimeError, "Объект класса не создан, не соответсвуют данные." unless stations[-1].is_a? Station
  end
end

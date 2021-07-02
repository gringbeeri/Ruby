module RouteValidator
  def validate!
    raise RuntimeError, "Class object didn't create" unless stations[0].is_a? Station
    raise RuntimeError, "Class object didn't create" unless stations[-1].is_a? Station
  end
end

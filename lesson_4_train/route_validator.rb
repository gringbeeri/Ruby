module RouteValidator
  def validate!
    raise "Class object didn't create" unless stations[0].is_a? Station
    raise "Class object didn't create" unless stations[-1].is_a? Station
  end
end
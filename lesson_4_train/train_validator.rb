# frozen_string_literal: true

# TrainValidator
module TrainValidator
  def validate!
    raise "Class object didn't create." if number !~ REGISTER_NUMBER
  end

  REGISTER_NUMBER = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze
end

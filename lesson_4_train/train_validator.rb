# frozen_string_literal: true

module TrainValidator
  def train_validate!
    raise "Class object didn't create." if number !~ REGISTER_NUMBER
  end

  REGISTER_NUMBER = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i.freeze
end

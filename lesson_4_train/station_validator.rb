# frozen_string_literal: true

# StationValidator
module StationValidator
  def validate!
    raise TypeError, "Class object didn't create." if name !~ REGISTER_NAME
  end

  REGISTER_NAME = /^.{2}+/.freeze
end

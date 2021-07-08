# frozen_string_literal: true

# Valid
module Valid
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end

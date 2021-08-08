# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, valid)
    end
  end

  module InstanceMethods
    def validate!
    end
  end
end

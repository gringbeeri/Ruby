# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, valid)
      instance_name = "@#{name}".to_sym
      define_method("#{name}=".to_sym) do
        instance_variable_set(instance_name, value)
      end
    end
  end

  module InstanceMethods
    def validate!
    end
  end
end

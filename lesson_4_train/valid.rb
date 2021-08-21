# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(name, valid, *arg)
      arg.each do |argument|
        instance_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(instance_name) }
        define_method("#{name}=".to_sym) do |value|
          case valid
          when :presence
            raise "Class object didn't create." if value !~ /^.{1}+/.freeze
          when :format
            raise "Class object didn't create." if value !~ argument
          when :type
            raise "Class object didn't create." unless value.is_a? argument
          end
          instance_variable_set(instance_name, value)
        end
      end
    end
  end

  module InstanceMethods
    def validate!
      self.class.validate
    end
  end
end

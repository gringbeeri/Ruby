# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :validators

    def validate(attribute, type, params = nil)
      instance_name = "@#{attribute}".to_sym
      @validators = { instance_name => [type, params] }
    end
  end

  module InstanceMethods
    def validations
      self.class.validators || {}
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    # rubocop:disable Metrics/MethodLength
    def validate!
      validations.each do |name, attributes|
        valid = instance_variable_get(name)
        case attributes[0]
        when :presence
          raise "Class object didn't create." if valid !~ /^.{1}+/.freeze
        when :format
          raise "Class object didn't create." if valid !~ attributes[1]
        when :type
          raise "Class object didn't create." unless valid.is_a? attributes[1]
        end
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity
    # rubocop:enable Metrics/MethodLength
  end
end

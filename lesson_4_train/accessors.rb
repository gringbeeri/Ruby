# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      list_value = []
      instance_name = "@#{name}".to_sym
      define_method("#{name}_history".to_sym) { list_value }
      define_method(name) { instance_variable_get(instance_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(instance_name, value)
        list_value << value
      end
    end
  end

  def strong_attr_accessor(name, validate)
    instance_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(instance_name) }
    define_method("#{name}=".to_sym) do |value|
      instance_variable_set(instance_name, value) ? (value.is_a? validate) : (raise "Class object didn't create")
    end
  end
end

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    @@quantity = 0

    def instances
      puts "#{@@quantity} - quantity of copies"
    end

    def register_instance
      @@quantity += 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.register_instance
    end
  end
end

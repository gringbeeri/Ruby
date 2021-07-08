# frozen_string_literal: true

# Brend
module Brend
  def brend(name)
    self.name_company = name
  end

  def info_brend
    name_company
  end

  protected

  attr_accessor :name_company
end

# frozen_string_literal: true

# HeirClass
class PassWagon < Wagon
  attr_reader :busy_seat

  def initialize(free_seats)
    super
    raise "Data transfer don't right" unless free_seats.is_a? Integer
    raise "Data transfer don't right" if free_seats < 1

    @free_seats = free_seats
    @busy_seat = 0
  end

  def busy_seats
    @busy_seat += 1
  end

  def info_busy
    @busy_seat
  end

  def info_free
    @free_seats - @busy_seat unless @busy_seat > @free_seats
  end
end

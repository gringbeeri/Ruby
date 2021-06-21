class PassWagon < Wagon

  attr_reader :qty_busy_seats

  def initialize(qty_free_seats)
    @qty_free_seats = qty_free_seats
    @qty_busy_seats = 0
  end

  def take_seat
    @qty_busy_seats += 1
  end

  def info_busy_seats
    @qty_busy_seats
  end

  def info_free_seats
    @qty_free_seats -= @qty_busy_seats
    @qty_free_seats
  end
end

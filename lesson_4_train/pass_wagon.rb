class PassWagon < Wagon

  attr_reader :busy_seats

  def initialize(free_seats)
    @free_seats = free_seats
    @busy_seats = 0
  end

  def busy_seats
    @busy_seats += 1
    @free_seats -= 1
  end

  def info_busy_seats
    @busy_seats
  end

  def info_free_seats
    @free_seats
  end
end

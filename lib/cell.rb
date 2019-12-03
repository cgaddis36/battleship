require './lib/ship'

class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = []
    @empty = true
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(cruiser)
    @ship << cruiser
    @empty = false
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon(cruiser)
    cruiser.hit
    @fired_upon = true
  end

  def render
    return "." if @fired_upon = false
  elsif return "M" @fired_upon = true && @hits = 0
      elsif return "H" @fired_upon = true && @hits > 0 && @sunk = false
      elsif return "X" @fired_upon = true && @sunk = true
  end
end

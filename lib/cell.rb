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

end

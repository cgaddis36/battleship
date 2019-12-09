require './lib/ship'

class Cell
  attr_accessor :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = 0)
    @coordinate = coordinate
    @ship = 0
    @fired_upon = false
  end

  def empty?
    @ship == 0
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
      return if @ship == 0
    @ship.hit
  end

  def fired_upon?
    @fired_upon
  end

  def render(see = false)
    return "S" if see == true && @ship != 0
      if @fired_upon == false
        "."
      elsif @ship == 0
        "M"
      elsif @ship.health > 0
        "H"
      else
        "X"
    end
  end
end

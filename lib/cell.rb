require './lib/ship'

class Cell
  attr_accessor :coordinate, :ship, :fired_upon

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
    return if @ship == nil
    @ship.hit
  end

  def fired_upon?
    @fired_upon
  end

  def render(see = false)
    return "S" if see == true && @ship != nil
      if @fired_upon == false
        "."
      elsif @ship == nil
        "M"
      elsif @ship.health > 0
        "H"
      else
        "X"
    end
  end
end

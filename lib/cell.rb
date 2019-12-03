require './lib/ship'

class Cell
  attr_reader :coordinate, :ship

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
    return "." @fired_upon == false

    if @ship = nil
        "M"
    else
      if @ship.sunk == true
        "X"
    else
      if @ship.length > @ship.health
        "H"
    end
    end

  end





end

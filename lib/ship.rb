class Ship
  attr_reader :name, :length, :health, :sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @sunk = false
  end

  def hit
    @health -= 1
    return if @health > 0
    sunk?
  end

  def sunk?
    @health == 0
  end




end

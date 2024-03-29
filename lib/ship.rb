class Ship
  attr_reader :name, :length, :sunk
  attr_accessor :health

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
    if @health == 0
      @sunk = true
    else
      @sunk = false
    end
  end
end

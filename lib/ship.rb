class Ship
  attr_reader :name, :length
  attr_accessor :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = 3
    @sunk = false
    @hits = 0
  end

  def hit
    @health -= 1
    if health == 0
      @sunk = true
    end
  end

  def sunk?
    @sunk
  end

end

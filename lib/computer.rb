require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



class Computer
  attr_reader :direction, :start_cell
  attr_accessor :cruiser_cells, :submarine_cells
  def initialize(name = "Computer")
    @start_cell = 0
    @direction = direction
    @cruiser_cells = []
    @submarine_cells = []
    @row_rand = 0
    @column_rand = 0
  end

  def random_cell
    @row_rand = rand(65..68)
    @column_rand = rand(1..4)
  end

  def ship_orientation
      if rand(1..2) == 1
        @direction = "vertical"
      else
        @direction = "horizontal"
      end
  end

  def cruiser_cells_selection
    ship_orientation
    if @direction == "vertical"
      @row_rand = rand(65..66)
      @column_rand = rand(1..4)
    else
      @direction == "horizontal"
      @row_rand = rand(65..68)
      @column_rand = rand(1..2)
    end
    @start_cell = @row_rand.chr + @column_rand.to_s
    if @direction = "vertical"
        @cruiser_cells << @start_cell
        @cruiser_cells << (@row_rand + 1).chr + @column_rand.to_s
        @cruiser_cells << (@row_rand + 2).chr + @column_rand.to_s
    else
        @direction = "horizontal"
        @cruiser_cells << @start_cell
        @cruiser_cells << @row_rand.chr + (@column_rand + 1).to_s
        @cruiser_cells << @row_rand.chr + (@column_rand + 2).to_s
    end
    # binding.pry
  end

  def submarine_cells_selection
      ship_orientation
      if @direction == "vertical"
        @row_rand = rand(65..67)
        @column_rand = rand(1..4)
      else
        @direction == "horizontal"
        @row_rand = rand(65..68)
        @column_rand = rand(1..3)
      end
      @start_cell = @row_rand.chr + @column_rand.to_s
        if @direction = "vertical"
          @submarine_cells << @start_cell
          @submarine_cells << (@row_rand + 1).chr + @column_rand.to_s
        else
          @direction = "horizontal"
          @submarine_cells << @start_cell
          @submarine_cells << @row_rand.chr + (@column_rand + 1).to_s
        end
  end
end

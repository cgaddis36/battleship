require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



class Computer
  attr_reader :name, :direction, :start_cell, :cruiser_cells, :submarine_cells

  def initialize(name = "Computer")
    @name = name
    @rows_ord = []
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
    @start_cell = @row_rand.chr + @column_rand.to_s
  end

  def cruiser_cells_selection
    random_cell
    ship_orientation
    if @direction == "vertical" && @row_rand >= 67
      random_cell
    elsif @direction == "horizontal" && @column_rand >= 3
      random_cell
    else
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
    end
  end

  def submarine_cells_selection
    random_cell
    if @direction == "vertical" && @row_rand == 69
      random_cell
    elsif @direction == "horizontal" && @column_rand == 4
      random_cell
    else
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

  def ship_orientation
      if rand(1..2) == 1
        @direction = "vertical"
      else
        @direction = "horizontal"
      end
    end

    def computer_takes_shot
      @start_cell




end

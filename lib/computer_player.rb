require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



class ComputerPlayer
  attr_reader :name

  def initialize(name = "Computer")
    @name = name
    @rows_ord = []
    @start_cell = 0
    @direction = direction
  end

  def places_its_ships
    choose_cruiser_placement
    choose_submarine_placement
  end

  def choose_ship_placement()

  end

  def convert_rows_to_integers
    @rows_ord = board.rows.map {|number| number.ord}
  end

  def random_coordinate_select

    row_rand = rand(65..68)
    column_rand = rand(1..4)
    @start_cell = row_rand.chr + column_rand.to_s
  end

  def ship_orientation
      if rand(1..2) == 1
        @direction = vertical
      else
        @direction = horizontal
      end





end

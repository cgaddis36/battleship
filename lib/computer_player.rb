require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'



class ComputerPlayer
  attr_reader :name

  def initialize(name = "Computer")
    @name = name
    @rows_ord = []

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

    rand(65..68)
letter = @rows_ord.
    number = board.columns.rand(1..4)
    @first_point = letter + number
  end

  def
end

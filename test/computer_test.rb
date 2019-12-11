require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/game'

class ComputerTest <Minitest::Test

  def setup

  @game = Game.new
  @board = Board.new
  @computer = Computer.new
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  end

  def test_computer_cell_choice
    @computer.random_cell
    assert_equal true, @board.valid_coordinate?(@computer.start_cell)
  end

def test_ship_orientation_gives_direction
  @computer.ship_orientation
  possible_outcomes = ["vertical", "horizontal"]
  assert_equal true, possible_outcomes.include?(@computer.direction)
end



end

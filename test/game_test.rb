require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameTest <Minitest::Test
  def setup
    @game = Game.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @game.player_supplied_coordinates = "A1 A2 A3"
    @player_cruiser = Ship.new("Cruiser", 3)
  end

  def test_player_supplied_coordinates_start_as_string_turn_to_array
    assert_equal "A1 A2 A3", @game.player_supplied_coordinates
    assert_equal ["A1", "A2", "A3"], @game.split_player_supplied_coordinates
  end

  def test_split_player_supplied_coordinates
    @game.player_supplied_coordinates = "A1 A2 A3"
    @game.split_player_supplied_coordinates

    assert_equal ["A1", "A2", "A3"], @game.player_board.placement_coordinates
  end

  # def test_check_coordinates_can_check_coordinates
  #   @game.ship = @player_cruiser
  #   @game.check_coordinates
  #   assert_equal true, @game.check_coordinates
  #   @game.player_supplied_coordinates = "A1 A1 A1"
  #   assert_equal false, @game.check_coordinates
  # end





  end

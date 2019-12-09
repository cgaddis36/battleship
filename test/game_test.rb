require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameTest <Minitest::Test
  def setup
    @game = Game.new("Player One")
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @game.player_supplied_coordinates = "A1 A2 A3"
  end

  def test_player1_and_player2_have_names
    assert_equal "Player One", @game.player1
    assert_equal "Computer", @game.player2
  end

  def test_player_supplied_coordinates_start_as_string_turn_to_array
    assert_equal "A1 A2 A3", @game.player_supplied_coordinates
    assert_equal ["A1", "A2", "A3"], @game.split_player_supplied_coordinates
  end





  end

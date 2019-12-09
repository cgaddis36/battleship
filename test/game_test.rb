require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameTest <Minitest::Test
  def setup
    @board = Board.new
    @game = Game.new("Player One")
  end

  def test_player1_and_player2_have_names
    assert_equal "Player One", @game.player1
    assert_equal "Computer", @game.player2
  end


  end

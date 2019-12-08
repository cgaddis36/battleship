require './lib/ship'
require './lib/cell'
require './lib/turn'
require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class TurnTest <Minitest::Test
  def setup
    @board = Board.new
    @turn = Turn.new("Player One")
  end

  def test_player1_and_player2_have_names
    assert_equal "Player One", @turn.player1
    assert_equal "Computer", @turn.player2
  end


  end

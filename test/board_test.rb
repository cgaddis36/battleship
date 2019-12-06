require './lib/ship'
require './lib/cell'
require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BoardTest <Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    @cell_4 = @board.cells["C3"]
  end

  def test_board_is_an_instance_of_board
    assert_instance_of Board, @board
  end

  def test_board_has_16_cells_and_knows_if_cells_are_valid
    assert_equal 16, @board.cells.length
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("B1")
    assert_equal true, @board.valid_coordinate?("C1")
    assert_equal true, @board.valid_coordinate?("D1")
    assert_equal true, @board.valid_coordinate?("A4")
    assert_equal false, @board.valid_coordinate?("A22")
    assert_equal false, @board.valid_coordinate?("33")
    assert_equal false, @board.valid_coordinate?("Zebra")
    assert_equal false, @board.valid_coordinate?(nil)
  end

  def test_if_board_can_check_for_valid_ship_placement_by_size
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "A2", "A4"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["33", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["Zebra", "A3"])
    assert_equal false, @board.valid_placement?(@cruiser, [nil, "A2", "A3"])
  end



  def test_if_board_can_check_for_consecutive_placement
    assert_equal true, @board.valid_placement?((@submarine), ["A1","A2"])
    assert_equal false, @board.valid_placement?((@cruiser), ["A1","A2","A4"])
    assert_equal true, @board.valid_placement?((@submarine), ["A1","B1"])
    assert_equal false, @board.valid_placement?((@cruiser), ["A1", "B1", "D1"])
    assert_equal false, @board.valid_placement?((@submarine), ["C1","B1"])
    assert_equal false, @board.valid_placement?((@cruiser), ["A3", "A2", "A1"])
  end

  def test_if_board_can_check_for_diagonal_placement
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_places_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @cell_3.ship == @cell_2.ship
  end

  def test_ships_cant_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "C2"])
  end

  def test_render_shows_ships
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.render
    assert @board.render(true) != @board.render
  end

  def test_render_can_show_hits
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_4.fire_upon
  
    @cell_3.fire_upon

    require "pry"; binding.pry
  end
end

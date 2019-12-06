require './lib/ship'
require './lib/cell'
require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BoardTest <Minitest::Test

  def test_board_is_an_instance_of_board
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_16_cells_and_knows_if_cells_are_valid
    board = Board.new
    assert_equal 16, board.cells.length
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("B1")
    assert_equal true, board.valid_coordinate?("C1")
    assert_equal true, board.valid_coordinate?("D1")
    assert_equal true, board.valid_coordinate?("A4")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_if_board_can_check_for_valid_ship_placement_by_size
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1","A2"])
    assert_equal false, board.valid_placement?(submarine, ["A1","A2", "A4"])
  end



  def test_if_board_can_check_for_consecutive_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.valid_placement?((submarine), ["A1","A2"])
    assert_equal false, board.valid_placement?((cruiser), ["A1","A2","A4"])
    assert_equal true, board.valid_placement?((submarine), ["A1","B1"])
    assert_equal false, board.valid_placement?((cruiser), ["A1", "B1", "D1"])
  end

  def test_if_board_can_check_for_consecutive_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_places_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_cant_overlap
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    refute board.valid_placement?(submarine, ["A1", "B1"])
  end
end

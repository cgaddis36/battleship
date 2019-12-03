require './lib/ship'
require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CellTest <Minitest::Test

  def test_is_instance_of_Cell
    cell = Cell.new("B4")

  assert_instance_of Cell, cell
  end

  def test_cell_has_coordinate
    cell = Cell.new("B4")

  assert_equal "B4", cell.coordinate
  end























end

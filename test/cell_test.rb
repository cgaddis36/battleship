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

  def test_cell_starts_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end

  def test_not_empty_after_placement_
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    # binding.pry
  assert_equal cruiser, cell.ship
  assert_equal false, cell.empty?
  end

  def test_cell_knows_its_been_fired_on
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    # binding.pry
    assert_equal false, cell.fired_upon?

    cell.fire_upon

    assert_equal 2, cruiser.health
    assert_equal true, cell.fired_upon?
  end

  def test_render_returns_correct_string_if_empty
    cell_1 = Cell.new("B4")

    assert_equal ".", cell_1.render

    cell_1.fire_upon

    assert_equal "M", cell_1.render
  end

  def test_render_returns_correct_if_not_fired_upon
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)

      cell_2.place_ship(cruiser)

      assert_equal ".", cell_2.render

      cell_2.fire_upon

      assert_equal "H", cell_2.render

    end

  def test_render_shows_ship_with_optional_argument
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_1 = Cell.new("C2")
    cell_3 = Cell.new("C4")

    cell_1.place_ship(cruiser)
    # binding.pry
    cell_2.place_ship(cruiser)


    assert_equal "S", cell_2.render(true)
      # binding.pry
    cell_3.place_ship(cruiser)

    cell_1.fire_upon
    cell_2.fire_upon
    cell_3.fire_upon
    # binding.pry
    assert_equal true, cruiser.sunk?
    assert_equal "X", cell_1.render
  end

  cell_2 = Cell.new("C3")
  cruiser = Ship.new("Cruiser", 3)
  cell_1 = Cell.new("C2")
  cell_3 = Cell.new("C4")

  cell_1.place_ship(cruiser)
  # binding.pry
  cell_2.place_ship(cruiser)
    # binding.pry
  cell_3.place_ship(cruiser)

  cell_1.fire_upon
  cell_2.fire_upon
  cell_3.fire_upon
  # binding.pry










end

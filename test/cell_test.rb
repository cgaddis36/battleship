require './lib/ship'
require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CellTest <Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cell_3 = Cell.new("C4")
  end

  def test_is_instance_of_Cell
    assert_instance_of Cell, @cell_1
  end

  def test_cell_has_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_cell_starts_empty
    assert_equal true, @cell_1.empty?
  end

  def test_not_empty_after_placement
    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
    assert_equal false, @cell_1.empty?
    assert_equal 0, @cell_2.ship
    assert_equal true, @cell_2.empty?
  end

  def test_cell_knows_its_been_fired_on
    @cell_1.place_ship(@cruiser)
    assert_equal false, @cell_1.fired_upon?
    assert_equal false, @cell_2.fired_upon?
    @cell_1.fire_upon
    assert_equal 2, @cruiser.health
    assert_equal true, @cell_1.fired_upon?
  end

  def test_render_returns_correct_string_if_empty
    assert_equal ".", @cell_1.render
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_render_returns_correct_if_not_fired_upon_also_if_hit
    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
  end

  def test_render_shows_ship_with_optional_argument
    @cell_1.place_ship(@cruiser)
    @cell_2.place_ship(@cruiser)
    assert_equal "S", @cell_2.render(true)
    @cell_3.place_ship(@cruiser)
    @cell_1.fire_upon
    @cell_2.fire_upon
    @cell_3.fire_upon
    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell_1.render
    assert_equal "X", @cell_2.render
    assert_equal "X", @cell_3.render
  end
end

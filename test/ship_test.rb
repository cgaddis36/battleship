require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)
    assert cruiser.name, "Cruiser"
    assert cruiser.length, 3
  end

  def cruiser_begins_with_3_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal cruiser.health, 3
  end

  def test_cruiser_is_not_sunk_to_start
    cruiser = Ship.new("Cruiser", 3)
    refute cruiser.sunk?
  end

  def test_hit_subtracts_health
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal cruiser.health, 2
  end

end

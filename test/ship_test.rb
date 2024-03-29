require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ShipTest <Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_is_instance_of_Ship
    assert_instance_of Ship, @cruiser
  end

  def test_ship_has_name_length_and_health_and_not_sunk_at_start
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
    assert_equal false, @cruiser.sunk?
  end

  def test_does_ship_lose_health_and_sink
    @cruiser.hit
    assert_equal 2, @cruiser.health
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal 1, @cruiser.health
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal 0, @cruiser.health
    assert_equal true, @cruiser.sunk?
  end
end

require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new("2")

    assert_instance_of Ship, ship
  end

  def test_it_has_length
    ship = Ship.new("2")
    ship_2 = Ship.new("3")

    assert_equal "2", ship.length
    assert_equal "3", ship_2.length 
  end
end

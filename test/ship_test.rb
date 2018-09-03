require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

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

  def test_it_starts_with_no_coordinates
    ship = Ship.new("3")

    assert_equal [], ship.coordinates
  end

  def test_player_can_randomize_a_coordinate
    ship = Ship.new("2")

    first_random = ship.randomize
    second_random = ship.randomize

    refute_equal first_random, second_random
  end

  def test_first_coord_not_D4_for_destroyer
    ship = Ship.new("2")
    100.times do
      expected = ship.verify_first_coord
      refute expected == "D4"
    end
  end

  def test_first_coord_not_C3_D3_C4_D4_for_cruiser
    ship = Ship.new("3")
    100.times do
      expected = ship.verify_first_coord
      refute expected == "C3"
      refute expected == "D3"
      refute expected == "C4"
      refute expected == "D4"
    end
  end

  def test_first_coord_added_to_array_after_verified
    ship = Ship.new("3")
    ship_2 = Ship.new("2")
    ship.verify_first_coord
    ship_2.verify_first_coord

    assert_equal 1, ship.coordinates.count
    assert_equal 1, ship_2.coordinates.count
  end

  def test_can_randomly_assign_orientation
    ship = Ship.new("2")
    ship.verify_first_coord

    test = []
    15.times do
      test << ship.random_orientation
    end
    actual = test.all? do |orientation|
      orientation == "vertical"
    end
    refute actual
  end

  def test_alpha_coords_return_nums
    ship = Ship.new("2")

    assert_equal 1, ship.alpha_compares("A")
    assert_equal 2, ship.alpha_compares("B")
    assert_equal 3, ship.alpha_compares("C")
    assert_equal 4, ship.alpha_compares("D")
  end

  def test_number_coords_return_alpha
    ship = Ship.new("2")

    assert_equal "A", ship.alpha_compares(1)
    assert_equal "B", ship.alpha_compares(2)
    assert_equal "C", ship.alpha_compares(3)
    assert_equal "D", ship.alpha_compares(4)
  end

  def test_can_return_second_coordinate_for_destroyer
    ship = Ship.new("2")

    ship.verify_first_coord
    ship.verify_next_coord

    assert_equal 2, ship.coordinates.count
  end

  def test_can_return_second_coordinate_for_cruiser
    ship = Ship.new("3")

    ship.verify_first_coord
    ship.verify_next_coord

    assert_equal 2, ship.coordinates.count
  end

end

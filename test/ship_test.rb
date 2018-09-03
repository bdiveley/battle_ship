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

  def test_orientation_is_horizontal_if_coord_D
    ship = Ship.new("3")
    ship_2 = Ship.new("2")
    ship.coordinates << "D1"
    ship_2.coordinates << "D3"

    assert_equal "horizontal", ship.random_orientation
    assert_equal "horizontal", ship_2.random_orientation
  end

  def test_orientation_is_vertical_if_coord_4
    ship = Ship.new("3")
    ship_2 = Ship.new("2")
    ship.coordinates << "B4"
    ship_2.coordinates << "A4"

    assert_equal "vertical", ship.random_orientation
    assert_equal "vertical", ship_2.random_orientation
  end

  def test_orientation_is_horizontal_if_C2_and_cruiser
    ship = Ship.new("3")
    ship.coordinates << "C2"

    assert_equal "horizontal", ship.random_orientation
  end

  def test_orientation_is_vertical_if_B3_and_cruiser
    ship = Ship.new("3")
    ship.coordinates << "B3"

    assert_equal "vertical", ship.random_orientation
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

  def test_can_add_2_more_coordinates_for_cruiser
    ship = Ship.new("3")

    ship.verify_first_coord
    ship.verify_next_coord

    assert_equal 3, ship.coordinates.count
  end

  def test_can_assign_coordinates_when_inputted
    ship = Ship.new("2")
    ship_two = Ship.new("3")

    ship.assign_coordinates("A1 A2")
    ship_two.assign_coordinates("B1 B3")

    assert_equal 2, ship.coordinates.count
    assert_equal 3, ship_two.coordinates.count
  end

  def test_can_assign_edge_coordinates_when_inputted
    ship = Ship.new("2")
    ship_two = Ship.new("3")

    ship.assign_coordinates("D3 D4")
    ship_two.assign_coordinates("B2 D2")

    assert_equal 2, ship.coordinates.count
    assert_equal 3, ship_two.coordinates.count
  end

end

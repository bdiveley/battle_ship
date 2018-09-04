require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/game'
require './lib/ship'
require './lib/board'
require './lib/space'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_game_starts_with_two_players
    game = Game.new

    assert_instance_of Player, game.computer
    assert_instance_of Player, game.person
  end

  def test_each_player_has_two_ships_to_start
    game = Game.new

    assert_instance_of Ship, game.computer.cruiser
    assert_instance_of Ship, game.computer.destroyer
    assert_instance_of Ship, game.person.cruiser
    assert_instance_of Ship, game.person.destroyer
  end

  def test_each_player_has_one_board_to_start
    game = Game.new

    assert_instance_of Board, game.computer.board
    assert_instance_of Board, game.person.board
  end

  def test_computer_destroyer_coords_assigned
    game = Game.new
    game.randomly_assign_coordinates

    assert_instance_of Array, game.computer.destroyer.coordinates
    assert_instance_of Array, game.computer.cruiser.coordinates
  end

  def test_can_assign_coordinates_randomly
    game = Game.new
    game.randomly_assign_coordinates

    assert_equal 2, game.computer.destroyer.coordinates.count
    assert_equal 3, game.computer.cruiser.coordinates.count
  end

  def test_can_assign_coordinates_from_user
    game = Game.new
    game.get_coordinates

    assert_equal 2, game.person.destroyer.coordinates.count
    assert_equal 3, game.person.cruiser.coordinates.count
  end

end

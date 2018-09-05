require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/ship'
require './lib/board'
require './lib/space'
require 'pry'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_player_starts_with_two_ships
    player = Player.new

    assert_instance_of Ship, player.destroyer
    assert_instance_of Ship, player.cruiser
  end

  def test_player_starts_with_board
    player = Player.new

    assert_instance_of Board, player.board
  end

  def test_correct_message_for_hitting_destroyer
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    guess = "A1"

    assert_equal "You hit my ship!", player.shot(guess)
  end

  def test_correct_message_for_hitting_cruiser
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    guess = "B3"

    assert_equal "You hit my ship!", player.shot(guess)
  end

  def test_correct_message_for_missing
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    guess = "A3"

    assert_equal "You missed!", player.shot(guess)
  end

  def test_correct_message_for_guessing_same_spot_twice
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("B3")

    assert_equal "This spot has already been guessed.  Try again!", player.shot("B3")
  end

  def test_space_changes_display_to_H_if_it_has_ship
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("A2")

    assert_equal "H", player.board.find_space("A2")[0].display
  end

  def test_space_changes_display_to_H_if_it_has_ship
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("B4")

    assert_equal "H", player.board.find_space("B4")[0].display
  end

  def test_space_changes_display_to_H_if_it_has_ship
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("C3")

    assert_equal "M", player.board.find_space("C3")[0].display
  end

  def test_ship_coords_changed_when_hit_made_destroyer
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("A1")

    assert_equal ["X", "A2"], player.destroyer.coordinates
  end

  def test_ship_coords_changed_when_hit_made_cruiser
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("B4")

    assert_equal ["B2", "B3", "X"], player.cruiser.coordinates
  end

  def test_ship_coords_changed_when_hit_made_cruiser
    player = Player.new
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("B4")
    player.shot("B2")

    assert_equal ["X", "B3", "X"], player.cruiser.coordinates
  end

  def test_will_display_ship_is_sunk
    player = Player.new
    player.cruiser.assign_coordinates("B2 B4")
    player.destroyer.assign_coordinates("D1 D2")
    player.shot("B4")
    player.shot("B2")

    assert_equal "You sunk my ship!", player.shot("B3")
  end

  def test_all_ships_sunk_returns_true
    player = Player.new
    player.cruiser.assign_coordinates("B2 B4")
    player.destroyer.assign_coordinates("A1 A2")
    player.shot("B4")
    player.shot("B2")
    player.shot("B3")
    player.shot("A1")
    player.shot("A2")
    assert player.all_sunk
  end
end

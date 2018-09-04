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

  def test_correct_message_for_hiting_destroyer
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    guess = "A1"

    assert_equal "You hit the destroyer", player.shot(guess)
  end

  def test_correct_message_for_hitting_cruiser
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    guess = "B3"

    assert_equal "You hit the cruiser", player.shot(guess)
  end

  def test_correct_message_for_missing
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    guess = "A3"

    assert_equal "You missed!", player.shot(guess)
  end

  def test_correct_message_for_guessing_same_spot_twice
    skip
    player = Player.new
    player.destroyer.assign_coordinates("A1 A2")
    player.cruiser.assign_coordinates("B2 B4")
    player.shot("B3")

    assert_equal "This spot has already been guessed.  Try again!", player.shot("B3")
  end
end

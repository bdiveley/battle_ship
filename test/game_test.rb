require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/game'
require './lib/ship'
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

end

require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/game'

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

end

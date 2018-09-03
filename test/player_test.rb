require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/ship'
require './lib/board'
require './lib/space'

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
end

require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/space'
require 'pry'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
  end

  def test_starts_with_board_of_space_objects
    board = Board.new

    assert_instance_of Space, board.grid[0][0]
    assert_instance_of Space, board.grid[1][1]
    assert_instance_of Space, board.grid[2][2]
    assert_instance_of Space, board.grid[3][3]
  end

  def test_can_display_row_of_space_diplays
    board = Board.new
    expected = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
    assert_equal expected, board.get_display_array
  end

  def test_can_display_final_board
    board = Board.new

    assert_equal " =========== \n .  1234 \n A:      \n B:      \n C:      \n D:      \n ===========", board.display_board
  end

  def test_will_return_true_if_space_is_available_for_guess
    board = Board.new
    guess = "A1"

    assert board.space_available?(guess)
  end



end

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

    assert_instance_of Space, board.grid[:A][0]
    assert_instance_of Space, board.grid[:B][1]
    assert_instance_of Space, board.grid[:C][2]
    assert_instance_of Space, board.grid[:D][3]
  end

  def test_can_display_row_of_lines
    board = Board.new

    assert_equal " ", board.display_board
  end

end

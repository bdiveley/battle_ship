require './test/test_helper.rb'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/space'
require 'pry'

class SpaceTest < Minitest::Test

  def test_instance_exists
    space = Space.new('A1')

    assert_instance_of Space, space
  end

  def test_instance_variables_available
    space = Space.new('A1')

    assert_equal 'A1', space.coordinate
    assert_equal " ", space.display
  end

end

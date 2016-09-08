require 'Minitest/pride'
require './lib/finder.rb'
require 'Minitest/autorun'
require 'pry'

class FinderTest < Minitest::Test

  def test_finder_can_take_argument
    f = Finder.new

    assert_equal :id, f.find(id, 3)
  end

end

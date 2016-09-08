require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/finder2'
require './lib/load2'

class FinderTwoTest < Minitest::Test

  def test_finder_can_take_argument
    l = Loader.new
    f = Finder.new
    input = gets.chomp

    l.load
    f.find(input)

    assert_equal ""

  end

end

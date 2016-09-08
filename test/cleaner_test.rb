require 'Minitest/pride'
require './lib/cleaner.rb'
require 'Minitest/autorun'
require 'pry'

class CleanerTest < Minitest::Test

  def test_phone_cleaner_can_take_parameter
    assert_equal "303-475-5049", Cleaner.clean_phone_number(3034755049)
  end

  def test_phone_cleaner_can_see_invalid_number
    assert_equal "Invalid phone number.", Cleaner.clean_phone_number(0)
  end

  def test_phone_cleaner_can_convert_good_number
    assert_equal "303-738-9571", Cleaner.clean_phone_number("(303)7389571")
  end

end

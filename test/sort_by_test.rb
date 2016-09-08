require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendees_repo'

class SortByTest < Minitest::Test

  def test_ability_to_sort
    skip
    h = AttendeesRepo.new

    h.find("first_name", "Sarah")


  end

  def test_find_method
    h = AttendeesRepo.new

    h.find("first_name", "Sarah")

    assert_equal '20009', h.queue.first.zipcode
  end

  def test_sort_by_method
    h = AttendeesRepo.new

    h.find("first_name", "Sarah")

    assert_equal '20009', h.queue.first.zipcode
    assert_equal '13703', h.sort_by_attribute('zipcode').first.zipcode
    assert_equal '73061', h.sort_by_attribute('zipcode').last.zipcode
  end

  def test_queue_print_by
    h = AttendeesRepo.new

    h.find("first_name", "Sarah")
    assert_equal '0', h.queue_print_by('zipcode')

  end

end

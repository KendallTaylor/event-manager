require 'minitest/pride'
require 'minitest/autorun'
require './lib/attendees_repo'

class AttendeesRepoTest < Minitest::Test

  def test_can_take_key_and_search_string
    n = AttendeesRepo.new('./event_attendees.csv')

    assert_equal 3, n.find('first_name', 'Sarah').count
  end

  def test_can_take_key_and_weird_search_string
    n = AttendeesRepo.new('./event_attendees.csv')

    assert_equal 3, n.find('first_name', 'SaRAh').count
  end

  def test_no_substring_matches
    n = AttendeesRepo.new('./event_attendees.csv')

    refute n.find('first_name', 'mary').include?("marybeth")
  end

  def test_can_search_on_something_other_than_first_name
    n = AttendeesRepo.new('./event_attendees.csv')

    assert_equal 3, n.find('state', 'CA').count
  end

  def test_doesnt_care_about_external_whitespace
    n = AttendeesRepo.new('./event_attendees.csv')

    assert_equal "Mary Kate", n.find('first_name', 'Mary Kate  ').first.first_name
  end

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
    assert_equal '13703', h.queue_print_by('zipcode').first.zipcode
  end

  def test_queue_count
   n = AttendeesRepo.new('./event_attendees.csv')

   n.find('first_name', 'Sarah').count

   assert_equal 3, n.queue_count
  end

  def test_queue_print_failing_test_for_visual
    skip
    n = AttendeesRepo.new('./event_attendees.csv')

    n.find('first_name', 'Sarah')

    assert_equal "I don't know", n.queue_print
  end

end

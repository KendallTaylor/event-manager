require 'minitest/pride'
require 'minitest/autorun'
require './lib/attendees_repo'

class QueueTest < Minitest::Test

 def test_queue_count
  n = AttendeesRepo.new('./event_attendees.csv')

  n.find('first_name', 'Sarah').count

  assert_equal 2, n.queue_count
 end

 def test_queue_print_failing_test_for_visual
   n = AttendeesRepo.new('./event_attendees.csv')

   n.find('first_name', 'Sarah')

   assert_equal "I don't know", n.queue_print
 end

end

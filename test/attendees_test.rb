require 'minitest/pride'
require 'minitest/autorun'
require './lib/attendees'

class AttendeesTest < Minitest::Test

  def setup
    @hash = {id: "2",
             regdate: "11/12/08",
             first_name: "Allison",
             last_name: "Nguyen",
             email_address: "arannon@jumpstartlab.com",
             homephone: "615438500",
             street: "3155 19th st NW",
             city: "Washington",
             state: "DC",
             zipcode: "20010"
            }
  end

  def test_can_fetch_id
    assert_equal "2", Attendee.new(@hash).id
  end

  def test_can_fetch_regdate
    assert_equal "11/12/08", Attendee.new(@hash).regdate
  end

  def test_can_fetch_first_name
    assert_equal "Allison", Attendee.new(@hash).first_name
  end

  def test_can_fetch_last_name
    assert_equal "Nguyen", Attendee.new(@hash).last_name
  end

  def test_can_fetch_email_address
    assert_equal "arannon@jumpstartlab.com", Attendee.new(@hash).email_address
  end

  def test_can_fetch_homephone
    assert_equal "615438500", Attendee.new(@hash).homephone
  end

  def test_can_fetch_street
    assert_equal "3155 19th st NW", Attendee.new(@hash).street
  end

  def test_can_fetch_city
    assert_equal "Washington", Attendee.new(@hash).city
  end

  def test_can_fetch_state
    assert_equal "DC", Attendee.new(@hash).state
  end

  def test_can_fetch_zipcode
    assert_equal "20010", Attendee.new(@hash).zipcode
  end

end

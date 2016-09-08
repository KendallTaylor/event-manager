require './lib/attendees_repo'
# require './lib/cleaner.rb'

class Attendee
  attr_reader :id, :regdate, :first_name, :last_name, :email_address, :homephone, :street, :city, :state, :zipcode

  def initialize(row)
    @id = row[:id]
    @regdate = row[:regdate]
    @first_name = row[:first_name]
    @last_name = row[:last_name]
    @email_address = row[:email_address]
    @homephone = AttendeesRepo.clean_phone_number(row[:homephone])
    @street = row[:street]
    @city = row[:city]
    @state = row[:state]
    @zipcode = AttendeesRepo.clean_zipcode(row[:zipcode])
  end


end

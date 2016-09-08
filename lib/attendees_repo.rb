require 'pry'
require 'csv'
require './lib/attendees'
# require './lib/wrapper'
# require './lib/cleaner.rb'

class AttendeesRepo
  attr_reader :queue

  def initialize(filename='./event_attendees.csv')
    contents = CSV.open filename, headers: true, header_converters: :symbol
    @attendees = contents.map do |row|
      Attendee.new(row)
    end
    @queue = []
  end

  def self.load(filename='./event_attendees.csv')
    AttendeesRepo.new(filename)
  end

  def find(key, search_string)
    @attendees.find_all do |row|
      if row.send("#{key}").downcase.strip == search_string.downcase.strip
        @queue << row
      end
    end
    @queue
  end

  def queue_count
    p @queue.count
  end

  def sort_by_attribute(attribute)
    sorted_queue = @queue.sort_by do |attendee|
      attendee.send(attribute)
    end
  end

  def queue_print_by(input)
    sorted_queue = sort_by_attribute(input)
    queue_print(sorted_queue)
  end

  def queue_print(queue=@queue)
    p print_headers
    print_data(queue)
  end

  def print_headers
    "#{"ID".ljust(4)}#{"LAST NAME".ljust(15)}#{"FIRST NAME".ljust(15)}#{"EMAIL".ljust(45)}#{"ZIP CODE".ljust(10)}#{"CITY ".ljust(20)}#{"STATE".ljust(10)}#{"ADDRESS".ljust(45)}#{"PHONE".ljust(20)}"
  end

  def print_data(queue=@queue)
    queue.each do |row|
    p "#{row.id.ljust(4)}#{row.last_name.ljust(15)}#{row.first_name.ljust(15)}#{row.email_address.ljust(45)}#{row.zipcode.ljust(10)}#{row.city.ljust(20)}#{row.state.ljust(10)}#{row.street.ljust(45)}#{row.homephone.ljust(20)}"
    end
  end

  def queue_clear
    @queue = []
  end

  def queue_save_to(csv_filename='bin/queue_return.csv')
    File.open(csv_filename,'w') do |file|
      file.puts @queue
    end
  end

  def queue_export_html(html_filename='bin/queue_return.html')
    File.open(html_filename, 'w') do |file|
      file.queue_print
    end
  end

  def self.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def self.clean_phone_number(phone_number)
    if phone_number.to_s.gsub(/\D/, "") .match(/^1?(\d{3})(\d{3})(\d{4})/)
      phone_number = [$1, $2, $3].join("-")
    else
      "Invalid phone number."
    end
  end

end

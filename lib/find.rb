require './lib/attendees'
require './lib/attendees_repo'
require 'csv'
require 'pry'

class Finder

  def find(key, search_string)
    @attendees.find_all do |row|
      if row.send("#{key}").downcase.strip == search_string.downcase.strip
        @queue << row
      end
    end
    @queue
  end

end

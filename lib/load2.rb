require 'csv'
require 'pry'

class Loader
  attr_accessor :file

  # def initialize
  #   @file = './event_attendees.csv'
  # end

  def load(filename='./event_attendees.csv')
    @file = CSV.read(filename, headers: true)
  end

  def self.find(key, search_string)
    # parsed = Wrapper.input.split(" ")
    Loader.file.find do |row|
      row[key] == search_string
    end
    # p "key: #{key}"
    # p "search_string: #{search_string}"
  end

end

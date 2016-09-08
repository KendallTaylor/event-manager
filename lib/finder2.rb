require 'csv'
require './lib/load2.rb'
require 'pry'

class Finder

  # input = gets.chomp

  def self.find(key, search_string)
    # parsed = Wrapper.input.split(" ")
    Loader.file.find do |row|
      row[key] == search_string
    end
    # p "key: #{key}"
    # p "search_string: #{search_string}"
  end

end

# wrapper class, methods class, 'holder' class
# holder class => stores/formats each row into array for use

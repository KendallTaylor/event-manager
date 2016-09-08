require 'csv'
require 'pry'
require './lib/finder'

class CSVData
  attr_accessor :data

  def initialize
    @data = []
  end

  def load(filename)
    @data = []
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      @data << row.to_hash
    end
    binding.pry
  end

end

# c = CSVData.new
# c.load("./event_attendees.csv")
# binding.pry

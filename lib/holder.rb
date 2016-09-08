# require './lib/load2'
# require './lib/wrapper'
# require './finder2'
require 'csv'
require 'pry'

class Holder

  def initialize
    @first_name = w.current.file.first_name
    binding.pry
  end

end

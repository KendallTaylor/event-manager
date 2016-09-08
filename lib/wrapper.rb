require 'csv'
require 'pry'
require './lib/attendees_repo'
require './lib/help'

class Wrapper

  def initialize(input=nil)
    @input = input
  end

  def self.options(input)
    case input.split(" ")[0]
    when "load"
      @current = AttendeesRepo.new
    when "find"
      @current.find(input.split(" ")[1], input.split(" ")[2])
    when "queue"
      case input.split(" ")[1]
      when "count"
        @current.queue.count
      when "clear"
        @current.queue.clear
      when "print"
        @current.queue_print
      when "district"
        @current.queue.populate
      when "print" && input.split(" ")[2] == "by"
        @current.queue.print_by(input.split(" ")[3])
      when "save"
        @current.queue.save_to(input.split(" ")[3])
      when "export"
        @current.queue.export_html(input.split(" ")[3])
      else
        p "Do you need help?"
        return
      end
    when "help" && input.split(" ")[1] != nil
      help.options(input.split(" ")[1])
    when "help"
      help.options(input)
    when "quit"
      return
    else
      p "Do you need help?"
      return
    end
  end

  w = Wrapper.new
  print '> '
  @input = gets.chomp
  until @input == "quit"
    print '> '
    @input = gets.chomp
    input = @input
    options(input)
  end

end

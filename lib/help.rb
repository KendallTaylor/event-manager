require './lib/wrapper'

class Help

  def options(input)
    if input == "Help"
      puts ["help", "help <command>", "load <filename>",  "queue clear", "queue count", "queue print", "queue district", "queue print by <attribute>", "queue save to <filename.csv>", "queue export html <filename.csv>", "find <attribute> <criteria>", "quit"]
    elsif input == "Help help"
      puts "Lists all available commands."
    elsif input == "Help help <command>"
      puts "Explains the usage of the entered command."
    elsif input == "Help load"
      puts "Loads the designated file for use."
    elsif input == "Help queue clear"
      puts "Empties the current queue."
    elsif input == "Help queue count"
      puts "Prints the number of items currently in the queue."
    elsif input == "Help queue print"
      puts "Lists the items in the queue, organised by id number."
    elsif input == "Help queue district"
      puts "If there are less than 10 entries in the queue, this command will use the Sunlight API to get Congressional District information for each entry."
    elsif input == "Help queue print by"
      puts "Print the data table sorted by the specified attribute."
    elsif input == "Help queue save to"
      puts "Export the current queue to the specified filename as a CSV."
    elsif input == "Help queue export html"
      puts "Export the current queue to the specified filename as a valid HTML file."
    elsif input == "Help find"
      puts "Search through the loaded file for the values entered."
    else
      puts "Invalid command."
    end
  end

end

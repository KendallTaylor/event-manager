class EventCompiler

  def load(file_name='event_attendees.csv')
    contents = nil
    contents = CSV.open file_name, headers: true, header_converters: :symbol
  end

end

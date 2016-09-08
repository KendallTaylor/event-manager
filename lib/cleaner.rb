require './lib/attendees.rb'

module Cleaner

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

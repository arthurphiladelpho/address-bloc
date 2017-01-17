require_relative 'entry'
# Why double quotes when using 'require' and single
# quotes when using 'require_relative'?
require "csv"

class AddressBook
	attr_reader :entries

	def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      if name < entry.name
        break
      end
      index+= 1
    end
    entries.insert(index, Entry.new(name, phone_number, email))
   end

   def import_from_csv(file_name)
    # We start out by reading the file and storing it 
    # in the 'csv_text' variable.
    csv_text = File.read(file_name)
    # We then parse the file and obtain a CSV::Table object.
    # We store it in the 'csv' variable.
    ### What is a CSV::Table object?
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # Next, we iterate over the CSV::Table object's rows and
    # create a hash for each row.
    csv.each do |row|
      row_hash = row.to_hash
      # Finally, we add the new row_hash as an entry to our AddressBook.
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
   end


end

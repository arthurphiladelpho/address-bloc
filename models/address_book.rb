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

  # Search AddressBook for a specific entry by name
  def binary_search(name)
    # We save the position of the first item in the array
    # using the 'lower' variable, and the position of the
    # last item in the array in the 'upper' variable.
    lower = 0
    upper = entries.length - 1

    # Here we loop over the array while 'lower' is less 
    # than or equal to the 'upper' variable.
    while lower <= upper
      # We set the varible 'mid' to be the index in the
      # middle of the array. Ruby automatically truncates
      # any decimal numbers. ie: 2.5 becomes 2 .
      mid = (lower + upper) / 2
      # We then set the 'mid_name' variable to the name
      # attribute of the entry in the middle of the array.
      mid_name = entries[mid].name
      # Next, we see if the 'mid_name' variable is the same
      # as the 'name' variable we passed in. If it is the
      # same we return the entry.
      if name == mid_name
        return entries[mid]
      # If it isn't the same we then check if 'name' is less
      # than 'mid_name' (Ruby automatically uses lexicographial
      # order). If so we set 'upper' to be one index less than
      # the 'mid' index.
      elsif name < mid_name
        upper = mid - 1
      # If 'name' isn't less than 'mid_name', we check if it is 
      # greater than 'mid_name' (I believe we could just use an
      # else statement here). If so we set 'lower' to be one index
      # higher than 'mid'.
      elsif name > mid_name
        lower = mid + 1
      end
    end
    # If we divide and conquer to the point where no match is found
    # we then return nil.
    return nil

  end

end

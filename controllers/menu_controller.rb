# Our menu_controller needs to connect to our Address Book.
require_relative '../models/address_book'

# Define class.
class MenuController
	attr_reader :address_book
 	# Initialize a new instance.
 	def initialize
 		@address_book = AddressBook.new
 	end
 	# Display the main menu's options in the command line.
 	def main_menu
 		puts "Main Menu - #{address_book.entries.count} entries"
 		puts "1 - View all entries"
 		puts "2 - Create an entry"
 		puts "3 - Search for an entry"
 		puts "4 - Import entries from a CSV"
 		puts "5 - Exit"
 		print "Enter your selection: "
    # Get user's input and prints it.
    selection = gets.to_i

    case selection
    	when 1
    		system "clear"
    		puts "You picked #{selection}"	
        view_all_entries
        main_menu
			when 2
       	system "clear"
       	puts "You picked #{selection}"
        create_entry
        main_menu
			when 3
       	system "clear"
       	puts "You picked #{selection}"
        search_entries
        main_menu
			when 4
       	system "clear"
       	puts "You picked #{selection}"
        read_csv
        main_menu
			when 5
       	puts "Good-bye!"
       	puts "You picked #{selection}"
        exit(0)
			else
     		system "clear"
     		puts "Sorry, that is not a valid input"
     		main_menu
    end
  end # of main_menu method

  def view_all_entries
  	address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def entry_submenu(entry)
  	puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
      when "n"
      when "d"
        delete_entry(entry)
      when "e"
        edit_entry(entry)
        # Display a submenu for the entry under edit.
        # Why?
        entry_submenu(entry)
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
 
  def create_entry
		system "clear"
		puts "New AddressBloc Entry"
		print "Name: "
		name = gets.chomp
		print "Phone number: "
		phone = gets.chomp
		print "Email: "
		email = gets.chomp
		address_book.add_entry(name, phone, email)
		system "clear"
		puts "New entry created"
  end
 
  def read_csv
    # First we ask the user to input the name
    # of a CSV file to import. We use 'gets' to get
    # the file name using standard input. 'Chomp'
    # removes the automatic new line.
    print "Enter CSV file to import: "
    file_name = gets.chomp

    # We check to see if the file name is empty.
    # If so we send the user back to the main menu.
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    # We import the 'file_name' file and count how many entries
    # it has. If 'file_name' isn't valid an exception is thrown
    # and protected by the begin/rescue code block.
    begin
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end

  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    # Gather input from the user.
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
    # We update the entry attributes only if there was
    # input from the user.
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
    # #6
    puts "Updated entry:"
    puts entry
  end

  def search_entries
    print "Search by name: "
    name = gets.chomp
    match = address_book.binary_search(name)
    system "clear"
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry)
    # Print out submenu.
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    # Get user input.
    selection = gets.chomp
 
    # #14
    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end

end # of MenuController class.
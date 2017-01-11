# Connect to the menu_contoller.rb file.
require_relative 'controllers/menu_controller.rb'
# Create a new menu.
menu = MenuController.new
# Clear command line.
system "clear"
puts "Welcome to Address Bloc!"
# Display our menu.
menu.main_menu
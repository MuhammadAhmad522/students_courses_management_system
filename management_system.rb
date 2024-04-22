# Base class for all management systems

# This class is responsible for displaying the menu and getting the user's choice


class ManagementSystem
    def display_menu(menu_items)
      menu_items.each_with_index do |item, index|
        puts "#{index + 1}. #{item}"
      end
      puts "0. Go back to previous menu"
      print "Enter your choice: "
      gets.to_i
    end
  end


class BrewfinderCli::CLI 
  @@list = []
  def call
    puts "Welcome thirsty friend!" 
    sleep(1)
    puts "To view breweries in Los Angeles, enter 'view'"
    sleep (1)
    puts "To leave the app, input 'exit'" 
    sleep (1)
    menu
  end
    
  def menu
    user_input = gets.strip.downcase
    if user_input == "view"
      Brewery.make_list
      puts Brewery.list
      find_by_number
    elsif user_input == "exit"
      goodbye
    else
      invalid
    end
  end

  def invalid
    puts "Invalid input, please try again! Resetting now..." 
    sleep 0.5
    call
  end

  def goodbye
    puts "Goodbye!"
    exit
  end

  def find_by_number
    puts "If you'd like more information on a brewery, enter it's number! If you'd like to exit, enter exit."
    input = gets.strip.downcase
    if input == "exit"
      goodbye
    else
      input_number = input.to_i
      if input_number >=24 || input_number <1
        puts "Error, Invalid number. Please try again!"
        sleep(1)
        puts Brewery.list
        find_by_number
      else 
        selected_brewery(input_number)
      end
    end
   end

  def selected_brewery(brewery) 
    selection = Brewery.all[brewery -1]
    puts "#{selection.name}"
      if selection.brewery_type != ""
        puts "Brewery Type: #{selection.brewery_type}"
      else
        puts "Brewery Type: Unknown"  
      end    
      if selection.street != ""
        puts "Location: #{selection.street}"
      else
        puts "Location: Unknown"
      end       
      if selection.phone != ""
        puts "Phone #: #{selection.phone}" 
      else
        puts "Phone #: Unknown"
      end
      if selection.website_url != ""
        puts "Website: #{selection.website_url}"
      else
        puts "Website: Unknown"
      end
    sleep(1)
    puts "To search for another brewery, enter 'another'. To exit, enter 'exit'."
    input = gets.strip.downcase
      if input == 'another'
        puts Brewery.list
        find_by_number
      elsif input == "exit"
        goodbye
      else 
        invalid
      end
  end
end


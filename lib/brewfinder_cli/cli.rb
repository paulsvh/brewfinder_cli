class BrewfinderCli::CLI 
  @@list = []
  def call
    puts "Welcome thirsty friend!" 
    sleep(1)
    puts "To view breweries on Los Angeles, enter 'view'"
    sleep (1)
    puts "To leave the app, input 'exit'" 
    sleep (1)
    menu
  end
    
  def menu
    user_input = gets.strip
    if user_input == "view"
      brewery_list
      menu      
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

  def brewery_list
    API.get_breweries
    Brewery.all.shift
    @@list << Brewery.all.each.with_index(1) do |brewery, index|     
     puts "#{index}. #{brewery.name}"
     end
     @@list
    puts "If you'd like more information on a brewery, enter it's number! If you'd like to exit, enter exit."
    input = gets.strip
    if input == "exit"
      goodbye
    else
      selected_brewery(input.to_i)
    end
  end
  
  def selected_brewery(brewery) 
  #Need to update to only puts if data exists
  #Need to fix "another" so the list updates with new/original index numbers

    selection = Brewery.all[brewery -1]
      puts "#{selection.name}"
      puts "Brewery Type: #{selection.brewery_type}"      
      puts "Location: #{selection.street}"      
      puts "Phone # #{selection.phone}"
      puts "#{selection.website_url}"
      puts "To search for another brewery, enter 'another'. To exit, enter 'exit'."
      input = gets.strip
      if input == 'another'
        puts @@list
      elsif input == "exit"
         goodbye
      else 
        invalid
    end
  end
end    

class BrewfinderCli::CLI 
  
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
    list = []
    list << Brewery.all.each.with_index(1) do |brewery, index|     
     puts "#{index}. #{brewery.name}"
     end
     list

    puts "If you'd like more information on a brewery, enter it's number! If you'd like to exit, enter exit."
    input = gets.strip
    if input == "exit"
      goodbye
    else
      selected_brewery(input.to_i)
    end
  end
  
  def selected_brewery(brewery)
    
    selection = Brewery.all[brewery -1]
      puts "#{selection.name}"
      if selection.brewery_type
        puts "Brewery Type: #{selection.brewery_type}"
      if selection.street  
      puts "Location: #{selection.street}"
      if selection.phone
      puts "Phone # #{selection.phone}"
      if selection.website_url
      puts "#{selection.website_url}"
      puts "To search for another brewery, enter 'another'. To exit, enter 'exit'."
      input = gets.strip
      if input == 'another'
        brewery_list
      elsif input == 'exit'
        goodbye
      else
        invalid
      end
  end

  

  
end
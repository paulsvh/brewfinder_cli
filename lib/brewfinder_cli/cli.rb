class BrewfinderCli::CLI 
 
 
  def call
    puts "Welcome thirsty friend!" 
    sleep(2)
    puts "To view breweries on Los Angeles, enter 'view'"
    sleep (2)
    puts "To leave the app, input 'exit'" 
    sleep (2)
    menu
  end
    
  def menu
    user_input = gets.to_i
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
    puts "Invalid input, please try again!"
    menu
  end

  def goodbye
    puts "Goodbye!"
    #exit the program
  end

  def brewery_list
    #returns a numbered list of breweries from the api
    puts "If you'd like more information on a brewery, enter it's number! If you'd like to exit, enter exit."
  end

  def selected_brewery
    #iterate over all of the breweries and return the one that the user selected
  end


  
end
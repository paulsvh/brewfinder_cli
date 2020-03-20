class BrewfinderCli::CLI 
 
 
  def call
    puts "welcome message" 
    sleep(2)
    puts "input city to see breweries in city"
    sleep (2)
    puts "input exit to leave the app" 
    sleep (2)
    menu
  end
    #use gsub to sub spaces in city names for an underscore
  def menu
    user_input = gets.strip.downcase
  
end
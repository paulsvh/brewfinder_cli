class API 
  @@all_breweries = []
  def self.get_breweries
  	response = HTTParty.get('https://api.openbrewerydb.org/breweries?per_page=50&by_city=los_angeles')
  	response.each {|hash| Brewery.new(hash)}  
  end
  
end
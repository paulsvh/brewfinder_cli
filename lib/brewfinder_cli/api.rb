class API 
	def self.get_breweries
  		response = HTTParty.get('https://api.openbrewerydb.org/breweries?per_page=50&by_city=los_angeles')
  		response.each.with_index(1) do |hash, index| 
  			next if index == 1
  			Brewery.new(hash)  
  		end
  	end
  
end
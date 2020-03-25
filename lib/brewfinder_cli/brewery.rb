class Brewery
   attr_accessor :name, :brewery_type, :street, :phone, :website_url

   @@all = []

   def initialize(attributes)
   	attributes.each do |k, v|
   		self.send("#{k}=", v) if self.respond_to?("#{k}=")
   	end
   	savepoint
   end

   def savepoint
   	@@all << self
   end

   def self.all
   	@@all
   end

   def self.make_list
   	API.get_breweries if self.all == []
   end

   def self.list
    self.all.map.with_index(1) do |brewery, index|
      "#{index}. #{brewery.name}"
    end
   end
      
end

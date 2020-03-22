class Brewery
   attr_accessor :name, :brewery_type, :street, :phone, :website_url

   @@list = []
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

   def self.list
   	@@list
   end

   def self.wipe
   	@@list.clear
   	@@all.clear
   end

   def self.make_list
   	wipe
   	API.get_breweries
    self.all.shift
    @@list << self.all.map.with_index(1) do |brewery, index|     
     "#{index}. #{brewery.name}"
 	end
   end
      
end

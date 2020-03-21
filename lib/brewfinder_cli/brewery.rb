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

   def self.find_by_number(number)
   	#return the brewery cooresponding to the number point on the list
   end


  
  
end

class Brewery

    @@all = []


    attr_accessor :name, :city

    def initialize(name, city)
        @name = name
        @city = city
        save
    end

    # def initialize(brewery_hash)
    #     brewery_hash.each do |k, v|
    #         self.send("#{k}=", v) if self.respond_to?("#{k}=")
    #    end 
    #         save
    # end


    def save #each new object is saved in the @@all array
        @@all << self
    end


    def self.all
        @@all
    end

    

    def self.find_brewery(brewery_name)
        self.all.find do |brewery|
            brewery.name == brewery_name
        end
    end

    def brewery_details(brewery)
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{brewery.name}"
        puts "City: #{brewery.city}"
        puts "State: #{brewery.state}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

        menu
    end 





end
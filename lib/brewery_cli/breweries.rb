class Brewery

    @@all = []


    attr_accessor :name, :city, :street

    def initialize(name, city, street)
        @name = name
        @city = city
        @street = street
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

    def self.town_breweries(city)
        self.all.select{|brewery| brewery.city == city}
    end

    def self.find_brewery(brewery_name)
        self.all.find do |brewery|
            brewery.name == brewery_name
        end
    end

    def self.find_brewery_street(name)
        bewery_name = self.all.find {|brewery| brewery.name == name}
        address = brewery_name.street
        puts "#{address}"
    end

    def brewery_details(brewery)
        puts "" 
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{brewery.name}"
        puts "City: #{brewery.city}"
        puts "Street: #{brewery.street}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end 





end
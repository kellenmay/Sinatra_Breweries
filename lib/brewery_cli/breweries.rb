class Brewery

    @@all = []


    attr_accessor :name, :city, :state

    # def initialize(name, city, state)
    #     @name = name
    #     @city = city
    #     @state = state
    #     save
    # end

    def initialize(brewery_hash)
        brewery_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
       end 
            save
    end


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







end
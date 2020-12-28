class Breweries


    @@all = []


    attr_accessor :name, :town, :state

    def initialize(name, town, state)
        @name = name
        @town = town
        @state = state
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
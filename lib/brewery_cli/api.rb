# This is where I will bring the API in and put it into Ruby usable notation



class API


    def self.get_data
        response = RestClient.get('https://api.openbrewerydb.org/breweries/')
        breweries_array = JSON.parse(response)["results"]
        breweries_array.each do |brewery|
            Breweries.new(brewery)
        end
    end     






end
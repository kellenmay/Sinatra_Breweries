# This is where I will bring the API in and put it into Ruby usable notation



class API


    def self.get_data
        response = RestClient.get('https://api.openbrewerydb.org/breweries?by_state=new_jersey&per_page=50')
        #binding.pry
        breweries_array = JSON.parse(response)
        breweries_array.each do |brewery|
            Brewery.new(brewery["name"], brewery["city"], brewery["street"])
        end
    end     



end
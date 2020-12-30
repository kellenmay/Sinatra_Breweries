#communitation class between user and API data 


# git init
# git add .
# git commit -m update
# git push

class CLI

    def start
        puts "Here is a list of microbreweries, trying to find one nearby?"
        puts "Let's start with your name:"
        greet(user_input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Hey there #{name}!"
        puts "Input 'y' to see the breweries, 'exit' if you've made a decision."
        list
    end

    def menu 
        selection = user_input 
        if selection == 'y' 
            brewery_name
        elsif selection == 'exit'
            goodbye
        else 
            invalid
        end 
    end 

    def list
        selection = user_input
        puts "#{selection}"
        # Brewery.find_brewery(selection)
        if selection == 'y'
            brewery_city
            puts "Where would you like to go?"
            city_select
            display_breweries
            #print the brewery (and address in that city)
        elsif selection == 'exit'
            #puts a goodbye statement
            goodbye
        else
            puts "invalid, try again"
            #invalid output, make user select again
            invalid
        end
    end

    def brewery_name
        Brewery.each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.name}"
         end
    end

    def brewery_city
        sorted_city.each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.city}"
         end
    end

    def sorted_city
        cities = Brewery.all.uniq{|brewery| brewery.city}
        sorted = cities.sort_by{|brewery| brewery.city}
    end        

    def city_select
        input = gets.strip.to_i
        if input.between?(1, sorted_city.count)
            @selected_city = sorted_city[input - 1]
            # binding.pry
        else
            puts "Sorry"
            brewery_city
        end
    end

    def display_breweries
        Brewery.town_breweries(@selected_city.city).each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.name}"
        end
    end 
    
    def brewery_selection
        puts "Select a brewery for more detail"

        selection = user_input 
        brewery = brewery.find_brewery(selection)
        brewery_details(brewery)
        # we'll query our brewery class to find the brewery's detail 
    end 

    def brewery_details(brewery)
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{brewery.name}"
        puts "city: #{brewery.city}"
        # puts "State: #{brewery.state}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        menu
    end

    def goodbye
        puts "See you there!"
    end

    def invalid
        puts "Cheers, but I think you made a typo there!"
    end

    def brewery_selection
        puts "Select a brewery for more detail!"
    end










end
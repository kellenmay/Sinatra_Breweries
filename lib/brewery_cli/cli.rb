#communitation class between user and API data 


# git init
# git add .
# git commit -m update
# git push

class CLI

    def start
        puts "Here is a list of microbreweries, trying to find one nearby?"
        puts "Let's start with your name:"
        name_greeting(user_input)
    end

    def user_input
        gets.strip
    end
    
    def name_greeting(name)
        puts "Hey there #{name}!"
        greet
    end
    
    def greet
        puts "Input 'y' to see the breweries, 'exit' if you've made a decision."
        list
    end 

    def list
        selection = user_input
        puts "#{selection}"
        # Brewery.find_brewery(selection)
        if selection == 'y'
            brewery_city
            puts "Where would you like to go?"
            # city_select
            #method for selecting a brewery
            display_breweries
            #print the brewery (and brewery_street in that city)
            brewery_select
        elsif selection == 'exit'
            #puts a goodbye statement
            goodbye
        else
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
         city_select  
    end

    def brewery_street
        input = gets.strip.to_i
        # Brewery.all.find_brewery_street(name)
    end



    def sorted_city
        cities = Brewery.all.uniq{|brewery| brewery.city}
        sorted = cities.sort_by{|brewery| brewery.city}
    end        

    def city_select
        input = gets.strip.to_i
        if input.between?(1, sorted_city.count)
            @selected_city = sorted_city[input - 1]
        else
            puts "Sorry"
            brewery_city
        end
        display_breweries
    end

    def display_breweries
        Brewery.town_breweries(@selected_city.city).each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.name}"
        end
        brewery_select 
    end 

    def brewery_select
        input = gets.strip.to_i
        address = Brewery.town_breweries(@selected_city.city)[input - 1].street
            puts "#{address}"
            correct_choice
    end

    def brewery_details(brewery)
        puts ""
        puts ""
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Name: #{brewery.name}"
        puts "city: #{brewery.city}"
        puts "Street: #{brewery.street}"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        list
    end

    def correct_choice
        puts "Would you like to see another Brewery? Type 'yes' or 'exit'" 
        input = gets.strip
        if input == "yes"
            brewery_city
        elsif input == "exit"
            goodbye
        else 
            puts "Sorry not a valid statement"
            correct_choice
        end
    end



    def goodbye
        puts "See you there!"
    end

    def invalid
        puts "Cheers, but I think you made a typo there!"
        greet
    end





end
#communitation class between user and API data 


# git init
# git add .
# git commit -m update
# git push

class CLI

    def start
        puts " "
        puts "Here is a list of microbreweries, trying to find one nearby?"
        puts " "
        puts " "
        puts "Let's start with your name:"
        name_greeting(user_input)
    end

    def user_input
        gets.strip
    end
    
    def name_greeting(name)
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts " "
        puts "Hey there #{name}!"
        puts " "
        greet
    end
    
    def greet
        puts "If you would like to see a list of breweries in NJ type 'list', if you don't want to see the list you can type 'exit'"
        list
    end 

    def list
        selection = user_input
        puts "#{selection}"
        # Brewery.find_brewery(selection)
        if selection == 'list'
            brewery_city
            #method for selecting a brewery
            display_breweries
            #print the brewery (and brewery_street in that city)
            puts "Select a Brewery for more info!"
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
         puts "Where would you like to go?" 
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
            display_breweries
        else
            puts "Looks like that was an invalid choice, would you like to try again?"
            invalid_city_select
        end
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
        if address == ""
            puts "Sorry we don't have that address on file!"
            correct_choice
        else
            puts "#{address}"
            correct_choice
        end
    end

    def correct_choice
        puts "Would you like to see another Brewery? Type 'yes' or 'exit'" 
        input = gets.strip
        if input == 'yes'
            brewery_city
        elsif input == 'exit'
            goodbye
        else 
            puts "Sorry not a valid statement"
            correct_choice
        end 
    end

    def invalid_city_select
            puts "Try 'yes' to see the list again and 'no' to exit"
            input = gets.strip
        if input == 'yes'
           	list
        elsif input == 'no'
            goodbye
        else 
            invalid_city_select
        end
    end

    def goodbye
        puts " "
        puts "See you there!"
    end

    def invalid
        puts " "
        puts "Cheers, but I think you made a typo there!"
        greet
    end





end
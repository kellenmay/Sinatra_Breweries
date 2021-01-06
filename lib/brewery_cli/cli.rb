#communitation class between user and API data 

# git init
# git add .
# git commit -m update
# git push

class CLI

    def start
        puts " "
        puts "Looks like you're trying to grab a beer, let me tell you where you can find some local breweries!".cyan
        puts " "
        puts "Would you mind telling me your name?".cyan
        name_greeting(user_input)
    end

    def user_input
        gets.strip
    end

    def name_greeting(name)
        puts " "
        puts "Welcome ".cyan + "#{name}" + "! I hope I can help you find what you're looking for!".cyan
        puts "  " 
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".cyan
        puts " "  
        greet
    end

    def greet
        puts "Would like to see a list of cities that have brewies in NJ type".cyan + " 'list' ".white + "or if you don't want to see the list you can type".cyan + " 'exit'.".white
        puts " "
        list
    end 

    def list
        puts " "
        selection = gets.strip
        if selection == 'list'
            brewery_city
        elsif selection == 'exit'
            goodbye
        else
            invalid
        end
    end

    def brewery_city
        sorted_city.each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.city}".cyan
        end 
         city_select
    end

    def city_select
        puts " "
        puts "Using the corresponding number of the city, where would you like to go?".cyan
        input = gets.strip.to_i
        if input.between?(1, sorted_city.count)
            @selected_city = sorted_city[input - 1]
            display_breweries
        else
            puts "Looks like that was an invalid choice, would you like to try again?".cyan + " 'yes'" + " or ".cyan + "'exit'" 
            invalid_city_select
        end
    end

    def display_breweries
        puts " "
        puts "Using the corresponding number of the brewery, where would you like to go?".cyan
        Brewery.town_breweries(@selected_city.city).each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.name}".cyan
        end
        brewery_select 
    end 

    def brewery_select
        input = gets.strip.to_i
        address = Brewery.town_breweries(@selected_city.city)[input - 1].street
        if address == ""
            puts "Sorry we don't have that address on file!".cyan
            correct_choice
        elsif input == 0
            puts "Sorry that seems to be an invalid response. Please try again.".cyan
            display_breweries
        else
            puts " "
            puts "#{address}".blue 
            correct_choice
        end
    end 

    def correct_choice
        puts " "
        puts "Would you like to see another Brewery? Type".cyan + " 'yes' ".white + "or".cyan + " 'exit'".white
        input = gets.strip
        if input == "yes"
            brewery_city
        elsif input == "exit"
            goodbye
        else 
            puts "Sorry not a valid statement".cyan
            correct_choice
        end 
    end

    def brewery_name
        Brewery.each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.name}".cyan
         end
    end
    
    def brewery_street
        input = gets.strip.to_i
    end

    def sorted_city
        cities = Brewery.all.uniq{|brewery| brewery.city}
        sorted = cities.sort_by{|brewery| brewery.city}
    end   
         
    def invalid_city_select
        input = gets.strip
        if input == 'yes'
               brewery_city
        elsif input == 'exit'
            goodbye
        else 
            puts "Try again"
            invalid_city_select
        end
    end

    def invalid
        puts "Cheers, but I think you made a typo there!".cyan
        greet
    end

    def goodbye
        puts "See you there!".cyan
    end




end
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
            puts " "
            puts "Looks like that was an invalid choice, would you like to try again?".cyan + " 'yes'" + " or ".cyan + "'exit'" 
            invalid_city_select
        end
    end

    def display_breweries
        puts " "
        puts "Using the corresponding number of the brewery, where would you like to go?".cyan
        puts " "
        Brewery.town_breweries(@selected_city.city).each.with_index(1) do |brewery, i|
            puts "#{i}. #{brewery.name}".blue
        end
        brewery_select 
    end 

    def brewery_select
        input = gets.strip.to_i
        if input.between?(0, Brewery.town_breweries(@selected_city.city).length)
            address = Brewery.town_breweries(@selected_city.city)[input - 1].street
                if address == ""
                    puts " "
                    puts "Sorry we don't have that address on file!".blue
                    puts " "
                    correct_choice
                else
                    puts " "
                    puts "#{address}".blue 
                    correct_choice
                end
        else
            incorrect_brewey_select #couldn't get it to exit on the first try without this method 
        end
    end 

    def incorrect_brewey_select
            puts " "
            puts "Sorry that seems to be an invalid response. Please try again.".cyan
            puts " "
            display_breweries
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
            puts " "
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
            puts " "
            puts "Try again".cyan
            puts " "
            invalid_city_select
        end
    end

    def invalid
        puts " "
        puts "Cheers, but I think you made a typo there!".cyan
        puts " "
        greet
    end

    def goodbye
        puts " "
        puts "See you there!".cyan
    end




end
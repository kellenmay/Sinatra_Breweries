#communitation class between user and API data 

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

    def list
        selection = user_input
        Brewery.find_brewery(selection)

        if selection == 'y'
            brewery_list
            menu
            #print list of breweries
        elsif selection == 'exit'
            #puts a goodbye statement
            goodbye
        else
            puts "invalid, try again"
            #invalid output, make user select again
            invalid
        end
    end

    def brewery_list
        ["brewery1", "brewery2", "brewery3"].each.with_index(1) do |brewery, i|
        puts "#{i}. #{brewery}"
    end
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
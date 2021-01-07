class CLI

    def start
        puts "Welcome to the Breaking Bad set."
        puts "Let's start with your name:"
        API.get_data
        greet(user_input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Nice to meet you #{name}, are you interested in learning more about the Breaking Bad characters?"
        puts "Input 'yes' to see the list of characters, 'exit' to leave the set."
        menu
    end

    def characters_list
        Characters.all.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
        end
        character_choice
    end

    def goodbye
        puts "It was nice meeting you , come back anytime!"
        exit
    end

    def invalid
        puts "I'm not sure what you mean. Try again please. Enter either 'yes' to see the list of characters or 'exit' to leave the set"
        menu
    end

    def character_choice
        puts "Select a character for a deeper look"

        selection = user_input
        if character = Characters.find_character(selection)
            character_details(character)
        elsif selection == 'exit'
            goodbye
        else
            invalid
        end
        
     end

    def character_details(character)
        puts ""
        puts ""
        puts "--------------------------------------"
        puts "Name: #{character.name}"
        puts "Occupation: #{character.occupation}"
        puts "Nickname: #{character.nickname}"
        puts "Portrayed: #{character.portrayed}"
        puts "--------------------------------------"
        puts ""
        puts "If you would like to see the list of characters again enter 'yes' otherwise enter 'exit'"
        menu
    end

    def menu
        selection = user_input

        if selection == 'yes'
            characters_list
            menu
        elsif selection == 'exit'
            goodbye
        else
            invalid
        end

    end

end
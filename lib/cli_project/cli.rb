class CliProject::CLI

    def call
        puts "Top 5 Video Games of All Time:"
        list_games
        menu
        goodbye
    end

    def list_games
        puts "1. Game 1"
        puts "2. Game 2"
        puts "3. Game 3"
        puts "4. Game 4"
        puts "5. Game 5"
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter game number to get more info, enter list to see top 5 games list, or enter exit:"

            input = gets.strip.downcase
            case input
            when "1"
                puts "More info on Game 1"
            when "2"
                puts "More info on Game 2"
            when "3"
                puts "More info on Game 3"
            when "4"
                puts "More info on Game 4"
            when "5"
                puts "More info on Game 5"
            when "list"
                list_games
            else
                puts "Enter valid selection."
            end
        end
    end

    def goodbye
        puts "Goodbye!"
    end

end
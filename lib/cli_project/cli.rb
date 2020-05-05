class CliProject::CLI

    def call
        list_games
        menu
        goodbye
    end

    def list_games
        puts "Top 5 Video Games of All Time:"
        @games = CliProject::Game.top
        @games.each.with_index(1) do |game, i|
            puts "#{i}. #{game.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter game number to get more info, enter list to see top 5 games list, or enter exit:"
            input = gets.strip.downcase

            if input.to_i > 0
                puts @games[input.to_i-1]
            elsif input == "list"
                list_games
            else
            # case input
            # when "1"
            #     puts "More info on Game 1"
            # when "2"
            #     puts "More info on Game 2"
            # when "3"
            #     puts "More info on Game 3"
            # when "4"
            #     puts "More info on Game 4"
            # when "5"
            #     puts "More info on Game 5"
            # when "list"
            #     list_games
            # else
                puts "Enter valid selection."
            end
        end
    end

    def goodbye
        puts "Goodbye!"
    end

end
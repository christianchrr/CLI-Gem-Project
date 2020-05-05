class CliProject::Game

    attr_accessor :name, :url

    def self.top
        # puts "1. Game 1"
        # puts "2. Game 2"
        # puts "3. Game 3"
        # puts "4. Game 4"
        # puts "5. Game 5"

        game_1 = self.new
        game_1.name = "Game 1"
        game_1.url = "https://www.ign.com/lists/top-100-games/1"

        game_2 = self.new
        game_2.name = "Game 2"
        game_2.url = "https://www.ign.com/lists/top-100-games/2"

        game_3 = self.new
        game_3.name = "Game 3"
        game_3.url = "https://www.ign.com/lists/top-100-games/3"

        game_4 = self.new
        game_4.name = "Game 4"
        game_4.url = "https://www.ign.com/lists/top-100-games/4"

        game_5 = self.new
        game_5.name = "Game 5"
        game_5.url = "https://www.ign.com/lists/top-100-games/5"

        [game_1, game_2, game_3, game_4, game_5]
    end

end
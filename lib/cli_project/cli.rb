class CliProject::CLI

    def call
        list_restaurants
        menu
        goodbye
    end

    def list_restaurants
        puts "Top Restaurants in Charleston, SC:"
        Scraper.scrape_restaurant("https://www.10best.com/destinations/south-carolina/charleston/restaurants/best-restaurants/", "div.list-headline")
        @restaurants = Restaurant.all.reverse
        @restaurants.each.with_index(1) do |restaurant, i|
            puts "#{i}. #{restaurant.name.strip}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter restaurant number to get more info, enter list to see top restaurants list, or enter exit:"
            input = gets.strip.downcase

            if input.to_i > 0
                the_restaurant = @restaurants[input.to_i-1]
                puts "#{the_restaurant.name.strip}"
                Scraper.scrape_details(the_restaurant.link, ".dt-poi-detail-section.one-third", the_restaurant)
                puts "#{the_restaurant.address.strip}"
            elsif input == "list"
                list_restaurants
            else
                puts "Enter valid selection"
            end
        end
    end

    def goodbye
        puts "Goodbye!"
    end

end
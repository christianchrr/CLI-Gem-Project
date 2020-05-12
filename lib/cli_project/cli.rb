class CliProject::CLI

    def call
        list_restaurants
    end 

    def list_restaurants
        puts "Top Restaurants in Charleston, SC:"
        Scraper.scrape_restaurant("https://www.10best.com/destinations/south-carolina/charleston/restaurants/best-restaurants/", "div.list-headline")
        @restaurants = Restaurant.all.reverse
        @restaurants.each.with_index(1) do |restaurant, i|
            puts "#{i}. #{restaurant.name.strip}"
        end
        menu
    end

    def menu
        input = nil
        while input != "exit"
            puts "\n"
            puts "Enter restaurant number to get more info, enter list to see top restaurants list, or enter exit:"
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i <10
                the_restaurant = @restaurants[input.to_i-1]
                puts "\n"
                puts "#{the_restaurant.name.strip}"
                puts "================"
                Scraper.scrape_details(the_restaurant.link, ".dt-poi-detail-section.one-third", the_restaurant)
                puts "Information:"
                puts "#{the_restaurant.address}".gsub("Address:", "").strip.gsub("29403", "29403\n").gsub("29401", "29401\n")
            elsif input == "list"
                Restaurant.all.reverse.each_with_index { |restaurant, index| puts "#{index + 1}. #{restaurant.name.strip}" }
            elsif input == "exit"
                goodbye
            else
                puts "Enter valid selection"
            end
        end
    end

    def goodbye
        puts "Goodbye!"
    end

end
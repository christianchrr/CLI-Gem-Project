class Scraper

    def self.scrape_restaurants
        html_to_elements = open("https://www.10best.com/destinations/south-carolina/charleston/restaurants/best-restaurants/")
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        restaurant_elements = parsed_html_elements.css("div.list-headline")
        restaurant_elements.each do |element|
            restaurant = Restaurant.new
            restaurant.name = element.text
            restaurant.link = "https://www.10best.com/"+element.css("a").first["href"] 
        end
    end

    def self.scrape_details(restaurant)
        html_to_elements = open(restaurant.link)
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        restaurant_address = parsed_html_elements.css(".dt-poi-detail-section.one-third").first.text.strip
        restaurant.address = restaurant_address
    end
end


# (the_restaurant.link, ".dt-poi-detail-section.one-third", the_restaurant)
# ("https://www.10best.com/destinations/south-carolina/charleston/restaurants/best-restaurants/", "div.list-headline")
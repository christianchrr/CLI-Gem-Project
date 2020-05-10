require 'nokogiri'
require 'pry'
require 'open-uri'

class Scraper

    def self.scrape_restaurant(url, element)
        url = url
        html_to_elements = open(url)
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        restaurant_elements = parsed_html_elements.css(element)
        restaurant_elements.each do |element|
            restaurant = Restaurant.new
            restaurant.name = element.text.strip
            restaurant.link = "https://www.10best.com/"+element.css("a").first["href"] 
        end
    end

    def self.scrape_details(url, element, restaurant)
        restaurant = restaurant
        html_to_elements = open(url)
        parsed_html_elements = Nokogiri::HTML(html_to_elements)
        restaurant_address = parsed_html_elements.css(element).first.text.strip
        restaurant.address = restaurant_address
    end
end
require 'httparty'

#Starter Code:
seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Lighthouse of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

BASE_URL = "http://maps.google.com/maps/api/geocode/json?address="

output = {}

seven_wonders.each do |wonder|
  @response = HTTParty.get("#{BASE_URL}#{wonder}")
    output[wonder] = @response["results"][0]["geometry"]["location"]
end

puts output

# for the human eye, but sometimes it's buggy

puts "\n"
puts "The Seven Wonders of the Ancient World"
puts "\n"
seven_wonders.each do |wonder|
  @response = HTTParty.get("#{BASE_URL}#{wonder}").parsed_response
  puts "Wonder: #{wonder}"
  puts "Latitude: #{@response["results"][0]["geometry"]["location"]["lat"]}"
  puts "Longitude: #{@response["results"][0]["geometry"]["location"]["lng"]}"
  puts "\n"
end

#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Lighthouse of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}

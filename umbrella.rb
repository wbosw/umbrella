require "http"
require "json"
pp "Where are you located"

#user_location = gets.chomp
user_location = "chicago"

pp user_location

#gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location.to_s + "&key=" + ENV.fetch("GMAPS_KEY")

#pp gmaps_url

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{ENV.fetch("GMAPS_KEY")}"

pp gmaps_url

raw_resp = HTTP.get(gmaps_url)

raw_resp.to_s

parsed_response = JSON.parse(raw_resp)

parsed_response

results = parsed_response.fetch("results")

first_result = results.at(0)

geometry = first_result.fetch("geometry")

lat_lng = geometry.fetch("location")

pp lat = lat_lng.fetch("lat")
pp lng = lat_lng.fetch("lng")

# "https://api.pirateweather.net/forecast/" + ENV[PIRATE_WEATHER_API_KEY] "/41.8887,-87.6355

# # Hidden variables
# pirate_weather_api_key = ENV["PIRATE_WEATHER_API_KEY"]

# # Assemble the full URL string by adding the first part, the API token, and the last part together
# pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

# # Place a GET request to the URL
# raw_response = HTTP.get(pirate_weather_url)

# require "json"

# parsed_response = JSON.parse(raw_response)

# currently_hash = parsed_response.fetch("currently")

# current_temp = currently_hash.fetch("temperature")

# puts "The current temperature is " + current_temp.to_s + "."

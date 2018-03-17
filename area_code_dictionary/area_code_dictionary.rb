@area_codes =
  { brazil: { itu: 11, florianoplis: 48 }, usa: { los_angeles: 213, new_york: 212 },
  new_zealand: { auckland: 9}, fiji: { suva: 679 }, costa_rica: { san_jose: 719 },
  indonesia: { jakarta: 21 }, senegal: { dakar: 8}, belgium: { chimay: 60 } }

# method to display city names
def display_countries
  @area_codes.each { |_k, v| puts _k.capitalize }
end

def display_all
  @area_codes.each do |_k, v|
    value = v || _k
    value.each {|key, value| puts _k, key.capitalize, value } if value.is_a?(Hash)
  end
  puts @area_codes
end

def display_cities(country)
  @area_codes.each do |_k, v|
    value = v || _k
    value.each {|key, value| puts key.capitalize } if country == _k && value.is_a?(Hash)
  end
end

def display_area_codes(country, city)
  puts @area_codes[country][city]
end

def snakecase_symbolize_response(response)
  @response = response.downcase.gsub(/\s/, '_').to_sym
end
# method to get area code, dial_book and the city name
puts "Welcome to the Area Code Dictionary."

puts "What's your name?"
name = gets.chomp

puts "Hello, #{name}"

@count = 0

loop do
  if @count == 0
    puts "Do you wanna play?"
    answer = gets.chomp
    uppercase = answer.upcase
  else
    puts "Keep playing?"
    answer = gets.chomp
    uppercase = answer.upcase
  end

  break unless uppercase == "Y"

  @count =+ 1

  display_countries

  puts "Please select a country."
  country = gets.chomp

  snakecase_symbolize_response(country)
  symbol_country = @response

  display_cities(@response)

  puts "Please select a city."
  city = gets.chomp

  snakecase_symbolize_response(city)

  display_area_codes(symbol_country, @response)
end

puts "To see a list of countries, with it's cities and area codes type 'countries', "
countries = gets.chomp
countries.upcase == "COUNTRIES" && display_all

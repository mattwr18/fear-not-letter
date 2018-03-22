# Pry is an IRB alternative
require 'pry'

@area_codes =
  { brazil: { itu: 11, florianopolis: 48 }, usa: { los_angeles: 213, new_york: 212 },
  new_zealand: { auckland: 9}, fiji: { suva: 679 }, costa_rica: { san_jose: 719 },
  indonesia: { jakarta: 21 }, senegal: { dakar: 8}, belgium: { chimay: 60 } }
# method to display countries

def display_countries
  @area_codes.each { |_k, v| puts _k.capitalize }
end

# method to reverse a symbol to a string or vice versa
# and remove or add snake case

def reverse_string_symbol(input)
  if input.is_a? Symbol
    input.to_s.gsub('_', ' ').capitalize
  else input.is_a? String
    input.downcase.gsub(/\s/, '_').to_sym
  end
end

#method to check if a country is part of the Hash

def country_exists(country)
  @country = reverse_string_symbol(country)

  if @area_codes[@country]
    display_cities(@country)
  else
    display_countries
    puts "Please make a selection from the countries listed or type 'no'."
    @retry = gets.chomp
    country_exists(@retry) unless @retry.upcase == "NO"
  end
end

# method to display cities of a selected country

def display_cities(country)
   @area_codes[@country].each { |k, v| puts reverse_string_symbol(k) }
end

# method to check if a city is part of the hash

def city_exists(country, city)
  @city = reverse_string_symbol(city)

  if @area_codes[@country].include?(@city)
    display_area_codes(@country, @city)
  else
    display_cities(@country)
    puts "Please make a selection from the cities listed or type 'no'."
    @retry = gets.chomp
    city_exists(@country, @retry) unless @retry.upcase == "NO"
  end
end

# method to display the area codes of a selected country and city

def display_area_codes(country, city)
  area_code = @area_codes[country][city]
  puts "The area code for #{reverse_string_symbol(city)}, #{reverse_string_symbol(country)} is #{area_code}"
end

# method to display all countries, cities and their area codes

def display_all
  @area_codes.each do |_k, v|
    value = v || _k
    value.each {|key, value| puts reverse_string_symbol(_k), key.capitalize, value }
  end
end

# start of the program

puts "Welcome to the Area Code Dictionary."

puts "What's your name?"
name = gets.chomp

puts "Hello, #{name}"

@count = 0

loop do
  if @count == 0
     puts "Do you wanna play?(Y, N)"
   else
     puts "Keep playing?(Y, N)"
  end

  answer = gets.chomp

  break unless answer.upcase == "Y"

  @count =+ 1

  puts "Here is a list of countries to select from."

  display_countries

  puts "Please select a country."
  country = gets.chomp

  country_exists(country)

  puts "Please select a city."
  city = gets.chomp

  city_exists(@country, city)
end

puts "To see a list of countries, with it's cities and area codes type 'countries', "
countries = gets.chomp
countries.upcase == "COUNTRIES" && display_all

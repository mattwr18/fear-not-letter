def hello
  puts "What is your first name?"
  @first_name = gets.chomp

  puts "And your last name?"
  @last_name = gets.chomp

  puts "Welcome to the analyzer, #{@first_name} #{@last_name}"
end

def name_length
  first_name_length = @first_name.length
  puts "You're first name has #{first_name_length} characters"

  last_name_length = @last_name.length
  puts "and your last name has #{last_name_length} characters"
end

def reverse_name
  full_name = "#{@first_name} #{@last_name}"
  puts "Look at your name in reverse!!"
  puts full_name.reverse
end

def multiply2_numbers(first_number, second_number)
  @result = first_number * second_number
end

def divide2_numbers(first_number, second_number)
  @result = first_number / second_number
end

def substract2_numbers(first_number, second_number)
  @result = first_number - second_number
end

def mod2_numbers(first_number, second_number)
  @result = first_number % second_number
end

def play_with_numbers
  puts "What would you like to do? Type 1)multiply, 2)divide, 3)subtract, or 4)get the remainder"
  play = gets.chomp

  puts "Please choose your first number"
  @first_number = gets.chomp
  @first_number_to_f = @first_number.to_f

  puts "And a second number?"
  @second_number = gets.chomp
  @second_number_to_f = @second_number.to_f

  case play
  when "1"
    multiply2_numbers(@first_number_to_f, @second_number_to_f)
  when "2"
    divide2_numbers(@first_number_to_f, @second_number_to_f)
  when "3"
    substract2_numbers(@first_number_to_f, @second_number_to_f)
  when "4"
    mod2_numbers(@first_number_to_f, @second_number_to_f)
  else
    puts "Sorry, that options doesn't exist"
  end

  puts "The result of your query is: #{@result}"
end


hello

name_length

reverse_name

play_with_numbers

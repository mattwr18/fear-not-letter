require 'pry'

def fear_not_letter(str)
  arr = str.upcase.split(//).map { |i| i.ord }.sort

  miss_arr = []
  x = 0
  next_num = arr[0].next

  arr.each do |curr_num|
    if curr_num == next_num
      next_num = arr[x].next
      x += 1
    elsif curr_num > next_num.next
      (next_num...curr_num).each { |n| miss_arr << n unless miss_arr.include?(n) || arr.include?(n) }
    else
      miss_arr << next_num
      next_num = arr[x].next
      x += 1
    end
  end

  miss_arr.shift

  if miss_arr.empty?
    puts "undefined"
  else
    miss_arr.map { |i| puts i.chr }.join('')
  end
end

puts fear_not_letter("abce") # => d
puts fear_not_letter("ab") # => "undefined"
puts fear_not_letter("acegikmoqsuwy") # => bdfhjlnprtvx
puts fear_not_letter("acegiy") # => bdfhjklmnopqurstuvwx
puts fear_not_letter("afy") # => bcdeghijklmnopqurstuvwx

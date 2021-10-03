codes = File.read('task79.txt')
first_numbers = []
second_numbers = []
third_numbers = []
codes.lines do |i|
  number = i.chomp.to_i.digits.reverse!
  first_numbers << number[0]
  second_numbers << number[1]
  third_numbers << number[2]
end

p "first numbers", first_numbers.uniq!
p "second numbers", second_numbers.uniq!
p "third numbers", third_numbers.uniq!
puts "The digits that make the code key"
result_digits = first_numbers | second_numbers | third_numbers
p result_digits
puts "------------------------------------------------------------------------------------------------"
puts "The first digit of the passcode is 7, for it’s the only digit that occurs only in first_numbers."
puts "The last digit of the code is 0, for it’s the only digit that occurs only in third_numbers."
puts "------------------------------------------------------------------------------------------------"
temp = []
counter = 0
(0..9).each do |x|
  if result_digits.include?(x.to_i) and x.to_i != 0 and x.to_i != 7
    print "Number berfore {", x, "}: "
    codes.lines do |line|
      if line.include?(x.to_s) and result_digits.include?(x.to_i)
        num = line.chomp.to_i.digits.reverse!.index(x.to_i)
        (0...num).each do |i|
          temp[counter] = line[i]
          counter += 1
        end
      end
    end
    counter = 0
    print temp.uniq!
    temp = []
    puts
  end
end
puts "------------------------------------------------------------------------------------------------"
puts "It is not difficult to guess that 3 is in the second position, and 9 before 0 (since all the remaining digits are behind it)"
puts "We have next: 73xxxx90"
puts "since 1 has no options other than 7 and 3 before it, therefore the next digit is 1, so we get 731xxx90"
puts 'By the same logic, it is not difficult to guess that the reuse code will be: "73162890"'
def minimalize(original)
  original.gsub!(/VI{4}/, 'IX')
  original.gsub!(/I{4}/, 'IV')
  original.gsub!(/LX{4}/, 'XL')
  original.gsub!(/X{4}/, 'XC')
  original.gsub!(/DC{4}/, 'CM')
  original.gsub!(/C{4}/, 'CD')
  original
end

roman_numbers = File.read('task89.txt')
number_of_characters = 0
roman_numbers.lines do |i|
  roman_number = i.chomp
  number_of_characters += roman_number.size - minimalize(roman_number).size
end
puts number_of_characters

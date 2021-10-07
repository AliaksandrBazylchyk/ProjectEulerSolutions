def fr(n)
  if n % 3 == 0
    n / 3 * 2
  else
    1
  end
end

e = 0
100.downto(2) do |n|
  e = Rational('1') / (fr(n) + e)
end
e += 2
puts e.numerator.to_s.each_char.map(&:to_i).inject(:+)
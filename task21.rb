s = 0
(1...1e4).each do |i|
  a = []
  (1...i).each do |j|
    a.push(j) if (i % j).zero?
  end
  b = a.sum
  a = []
  (1...b).each do |j|
    a.push(j) if (b % j).zero?
  end
  s += b  if a.sum == i && b != a.sum
  p s
end

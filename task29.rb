
a = []
(2..100).each do |i|
  (2..100).each do |j|
    a << (i.pow(j))
  end
end
p a.uniq.sort.count

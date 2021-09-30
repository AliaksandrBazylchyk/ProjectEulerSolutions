a = 2 ** 1000
s = a.to_s
a = s.each_char.map(&:to_i)
p a.sum

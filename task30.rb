
res = 0
(2..355000).each do |i|
  sum = 0
  num = i
  while (num > 0)
    d = num % 10
    num /= 10
    sum = sum + (d ** 5)
  end
  res += i if i == sum
end
p res
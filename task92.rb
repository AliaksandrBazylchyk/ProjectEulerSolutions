sum = 0
(1..1e7).each do |i|
  loop do
    i = i.digits.map { |n| n * n }.sum
    if i == 89
      sum+=1
      break
    end
    break if i==1
  end
end
p sum
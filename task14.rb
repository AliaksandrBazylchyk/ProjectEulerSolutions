a = {}
(1...1e6).each do |i|
  count = 0
  collaz = i
  loop do
    count += 1
    if collaz.even? && collaz != 1

      collaz /= 2
    else
      collaz = collaz * 3 + 1
    end
    break if collaz == 1
  end

  hs = { count+1 => i }
  a.update(hs)
end
p a.max

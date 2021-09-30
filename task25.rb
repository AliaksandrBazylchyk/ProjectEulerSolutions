def fib(n, memo = {})
  if n == 0 || n == 1
    return n
  end
  memo[n] ||= fib(n-1, memo) + fib(n-2, memo)
end
(1..5000).each do |i|
  a= fib i
  p i if a.to_s.length >= 1000
  break if a.to_s.length >= 1000
end

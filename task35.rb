require 'prime'
def del_2_5_prime(a)
  a=a.digits
  a.each{|i| return true if i%5==0 || i%2==0}
  false
end

arr=[]
Prime.each(1e6) do |prime|
  arr << prime
end
arr1=[2,3,5,7]
(4...arr.count).each do |i|
  k = del_2_5_prime(arr[i])
  arr1 << arr[i] unless k
end
arr=arr1
arr1=[]
arr.each do |i|
  arr1<< i if i.digits.count==1
  k = true
  i.digits.count.times do
    l=(i/(10**(i.digits.count-1)))
    i=(i%(10**(i.digits.count-1))*10+l)
    k = false unless i.prime?
  end
  arr1<<i if k && i>9
end
p arr1.count
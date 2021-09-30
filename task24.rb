
perms = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation.map
perms_count = 0
perms.each do |perm|
  perms_count += 1
  p perm if perms_count == 1e6
end


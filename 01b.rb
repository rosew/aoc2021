count = 0
last_sum = 0
depths = []

File.readlines('01a.txt').each do |line|
  depths << line.to_i
  next if depths.count < 3

  depths.shift if depths.count == 4

  depth_sum = depths.sum

  count += 1 if depth_sum > last_sum
  last_sum = depth_sum
end

# Will overcount by 1 with last starting at 0
puts count - 1

depths = File.readlines('01a.txt').map(&:to_i)
depth_sums = depths.each_cons(3).map(&:sum)
puts depth_sums.each_cons(2).count { |set| set[0] < set[1] }

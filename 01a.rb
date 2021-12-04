count = 0
last = 0
File.readlines('01a.txt').each do |line|
  depth = line.to_i
  count += 1 if depth > last
  last = depth
end

# Will overcount by 1 with last starting at 0
puts count - 1

depths = File.readlines('01a.txt').map(&:to_i)
puts depths.each_cons(2).count { |set| set[0] < set[1] }

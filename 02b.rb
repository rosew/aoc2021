forward = 0
aim = 0
depth = 0
File.readlines('02.txt').each do |move|
  command, distance = move.split(' ')
  distance = distance.to_i

  case command
  when 'forward'
    forward += distance
    depth += aim * distance
  when 'up'
    aim -= distance
  when 'down'
    aim += distance
  end
end

puts forward * depth

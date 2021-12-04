def read_and_convert_to_arrays_of_digits
  lines = File.readlines('03.txt')
  lines.map { |i| i.strip.chars.map(&:to_i) }
end

def find_max_per_column(lines)
  # split each column to it's own array and sum it
  columns = lines.transpose.map { |i| i.sum }

  # Sums over half have more 1s
  threshold = lines.count / 2
  ones = columns.map { |i| i > threshold ? 1 : 0 }
end

def binary_array_to_i(value)
  value.join.to_i(2)
end

lines = read_and_convert_to_arrays_of_digits
max_per_column = find_max_per_column(lines)

gamma = binary_array_to_i max_per_column
epsilon = binary_array_to_i max_per_column.map { |num| num == 1 ? 0 : 1 }

puts gamma
puts epsilon

puts gamma * epsilon

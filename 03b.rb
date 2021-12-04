def read_and_convert_to_arrays_of_digits
  lines = File.readlines('03.txt')
  lines.map { |i| i.strip.chars.map(&:to_i) }
end

def find_value_for_column(lines, column_num, comparison)
  threshold = lines.count / 2.0
  column_count = lines.map { |line| line[column_num] }.sum
  column_count.send(comparison, threshold) ? 1 : 0
end

def filter_by_values(lines, comparison, location)
  value = find_value_for_column(lines, location, comparison)
  lines = lines.filter { |line| line[location] == value }
  return lines.first if lines.count == 1

  filter_by_values(lines, comparison, location + 1)
end

def binary_array_to_i(value)
  value.join.to_i(2)
end

lines = read_and_convert_to_arrays_of_digits

o2 = binary_array_to_i filter_by_values(lines, :>=, 0)
co2 = binary_array_to_i filter_by_values(lines, :<, 0)

puts o2
puts co2
puts o2 * co2

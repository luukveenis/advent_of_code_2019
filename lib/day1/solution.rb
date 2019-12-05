def fuel_required(mass)
  mass / 3 - 2
end

def recursive_fuel_required(mass)
  fuel_required = mass / 3 - 2
  return 0 if fuel_required <= 0

  fuel_required + recursive_fuel_required(fuel_required)
end

input = File.readlines(ARGV[0], chomp: true)
puts "Part 1: #{input.sum { |line| fuel_required(line.to_i) } }"
puts "Part 2: #{input.sum { |line| recursive_fuel_required(line.to_i) } }"

def fuel_required(mass)
  mass / 3 - 2
end

input = File.readlines(ARGV[0], chomp: true)
puts input.sum { |line| fuel_required(line.to_i) }

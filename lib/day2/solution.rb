def intcode(input)
  values = input.split(",").map!(&:to_i)

  0.step(by: 4, to: values.length - 1) do |index|
    case values[index]
    when 1
      values[values[index + 3]] = values[values[index + 1]] + values[values[index + 2]]
    when 2
      values[values[index + 3]] = values[values[index + 1]] * values[values[index + 2]]
    when 99
      return values.join(",")
    else
      raise "Invalid opcode"
    end
  end
end

input = File.readlines(ARGV[0], chomp: true)

input.each_with_index do |line, index|
  puts intcode(line)
end

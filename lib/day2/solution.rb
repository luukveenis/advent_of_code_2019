class Computer
  attr_accessor :memory

  def self.find_inputs(intcode, result)
    (0..99).each do |noun|
      (0..99).each do |verb|
        computer = Computer.new(intcode)

        computer.memory[1] = noun
        computer.memory[2] = verb
        computer.call

        return [noun, verb]  if computer.memory[0] == result
      end
    end
  end

  def initialize(intcode)
    @memory = intcode.split(",").map!(&:to_i)
  end

  def call
    0.step(by: 4, to: memory.length - 1) do |pointer|
      case memory_at(pointer)
      when 1
        memory[memory_at(pointer + 3)] = value_at(pointer + 1) + value_at(pointer + 2)
      when 2
        memory[memory_at(pointer + 3)] = value_at(pointer + 1) * value_at(pointer + 2)
      when 99
        return memory.join(",")
      else
        raise "Invalid opcode"
      end
    end
  end

  private

  def memory_at(pointer)
    memory[pointer]
  end

  def value_at(pointer)
    memory[memory[pointer]]
  end
end

input = File.readlines(ARGV[0], chomp: true)

input.each_with_index do |line, index|
  puts Computer.new(line).call

  noun, verb = Computer.find_inputs(line, 19690720)
  puts 100 * noun + verb
end

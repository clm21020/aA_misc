def rpn(file = "")
  inputs = file.empty? ? input_from_command : read_file(file)
  stack = []
  inputs.each do |input|
    if input.to_i.to_s == input
      stack << input.to_i
    else
      right = stack.pop
      left = stack.pop
      stack << left.send(input.to_sym, right)
    end
  end
  stack.pop
end

def input_from_command
  inputs = []
  puts "Input an operator or operand, or hit ENTER to calculate"
  loop do
    input = gets.chomp
    input.empty? ? break : inputs << input
  end
  inputs
end

def read_file(file)
  File.readlines(file).map{ |line| line.chomp }
end

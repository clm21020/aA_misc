def shuffle
  file_name = prompt
  lines = File.readlines("#{file_name}.txt")
  lines.shuffle!
  shuffled_file_name = "#{file_name}-shuffled.txt"
  create_file(shuffled_file_name, lines)
  puts "Your new file is #{shuffled_file_name}"
end

def prompt
  puts "Please enter a file name:"
  gets.chomp
end

def create_file(new_file_name, lines)
  result = File.new(new_file_name, "w")
  lines.each{ |line| result << line }
  result.close
end

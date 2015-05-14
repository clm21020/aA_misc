class Code

  def self.random
    code_array = []
    4.times do |i|
      code_array << ['R', 'G', 'B', 'Y', 'O', 'P'].sample
    end

    Code.new(code_array)
  end

  def self.parse(input)
    Code.new(input.split(""))
  end

  def initialize(code)
    @code = code
  end

  def exact_matches(other_code)
    matches = 0
    4.times do |i|
        matches += 1 if @code[i] == other_code[i]
    end

    matches
  end

  def near_matches(other_code)
    matches = 0

    @code.each do |color|
      matches += 1 if other_code.include?(color)

    end

    matches - exact_matches(other_code)
  end

  def [](i)
    @code[i]
  end

  def include?(color)
    @code.include?(color)
  end

end

class Game

  MAX_GUESSES = 10

  def initialize
    @computer_code = Code.random
     puts "Welcome to Mastermind.  Here is your challenge:"
     puts "Hint: #{@computer_code[0..3]}"
  end

  def play
    turns = 1

    MAX_GUESSES.times do
      user_guess = Code.parse(prompt)
      print_status(user_guess)
      if won?(user_guess)
        puts "You won in #{turns} turns!"
        break
      end
      turns += 1
  end

    puts "Loser!" if turns > 10 
  end

  def won?(user_guess)
    user_guess.exact_matches(@computer_code) == 4
  end

  def print_status(user_guess)
    puts "Exact matches: #{user_guess.exact_matches(@computer_code)}"
    puts "Near matches: #{user_guess.near_matches(@computer_code)}"
  end

  def prompt
    puts "Enter guess: "
    gets.chomp
  end


end

Game.new.play

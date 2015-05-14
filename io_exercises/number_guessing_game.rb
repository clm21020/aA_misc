class NumberGame
  def initialize
    @computer_guess = rand(99) + 1
    @win = false
  end

  def prompt
    puts "Guess a number between 1 and 100:"
    gets.chomp.to_i
  end

  def check_guess(guess)
    if guess == @computer_guess
      true
    elsif guess > @computer_guess
      puts "Too high"
    else
      puts "Too low"
    end
  end

  def win
    puts "YOU WIN!!!!!!!!"
  end

  def run
    while !@win
      guess = prompt
      @win = check_guess(guess)
    end
    win
  end

end

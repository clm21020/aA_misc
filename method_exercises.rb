def rps(move)
  options = ["Rock", "Paper", "Scissors"]
  computer_move = options.sample
  puts "computer selected #{computer_move}"
  puts options.include?(move) ? winner(move, computer_move) : "Invalid move"
end

def winner(move, computer_move)
  win = "You win!"
  lose = "You lose!"
  case move
  when computer_move then "It's a tie!"
  when "Rock" then computer_move == 'Scissors' ? win : lose
  when "Paper" then computer_move == "Rock" ? win : lose
  when "Scissors" then computer_move == "Paper" ? win : lose
  end
end

def remix(ingredients)
  mixers = []
  drinks = Array.new(ingredients)

  drinks.each do |pair|
    mixers << pair[1]
  end
  mixers.shuffle!
  drinks.each_with_index do |pair, i|
    pair[1] = mixers[i]
  end

  drinks

end

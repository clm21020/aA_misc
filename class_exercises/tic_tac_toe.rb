class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3, Array.new(3, " "))
    # @board = [["X","O","X"],["X", "O","O"],["X"," ", " "]]
    # @board = Array.new(3) { Array.new(3) {"X"} }
  end

  def won?(pos, mark)
    horizontal_win?(pos, mark) || vertical_win?(pos, mark) || diagonal_win?(mark)
  end

  def horizontal_win?(pos, mark)
    row = pos[0]
    @board[row].all? do |place|
      place == mark
    end
  end

  def vertical_win?(pos, mark)
    col = pos[1]
    3.times do |i|
      return false if @board[i][col] != mark
    end
    return true
  end

  def diagonal_win?(mark)
    @board.length.times do |coord|
      return false if @board[coord][coord] != mark
    end
    @board.length.times do |row|
      col = (@board.length - 1) - row
      return false if @board[row][col] != mark
    end

    return true
  end

  def cats_game?
    @board.each do |row|
      return false if row.include?(" ")
    end
    return true
  end

  def display
    @board.each_with_index do |row, index|
      puts " " + row.join(" | ")
      puts "___ ___ ___" unless index == 2
    end
  end

  # def winner
  # end

  def empty?(pos)
    row = pos[0]
    col = pos[1]
    @board[row][col] == " "
  end

  def place_mark(pos, mark)
    row = pos[0]
    col = pos[1]
    @board[row][col] = mark
  end
end

class Game
  attr_accessor :player1, :player2, :board

  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new("Tomas")
    @player1.mark = "X"
    @player2 = HumanPlayer.new("Cassie")
    @player2.mark = "O"
    @current_player = @player1
  end

  def play

    loop do
      @board.display
      move_prompt(@current_player)
      desired_position = gets.chomp.split(",").map{ |coord| coord.to_i }
      if @board.empty?(desired_position)
        @board.place_mark(desired_position, @current_player.mark)
        if @board.won?(desired_position, @current_player.mark)
          @board.display
          win_message(@current_player)
          break
        elsif @board.cats_game?
        end
        toggle_player
      else
        invalid_move_warning
        next
      end
    end
  end

  def move_prompt(player)
    puts "#{player.name} enter your move as row,col (ex. 0,1)."
  end

  def win_message(player)
    puts "#{player.name} wins!"
  end

  def invalid_move_warning
    puts "That spot is taken, please try again."
  end

  def toggle_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

end

class Player
  attr_accessor :victory, :mark, :name
end

class HumanPlayer < Player
  def initialize(name)
    @victory = false
    @name = name
  end
end

class ComputerPlayer < Player
  def initialize
    @victory = false
    @name = "Computer"
  end
end

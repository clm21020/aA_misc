class Array
  def my_uniq
    answer = []
    self.each do |i|
      answer << i if !answer.include?(i)
    end
    return answer
  end

  def two_sum
    results = []
    self.length.times do |i|
      ((i+1)...(self.length)).each do |j|
        results << [i,j] if self[i] + self[j] == 0
      end
    end
    return results
  end
end

  def my_transpose(matrix)
    num_rows = matrix.length
    answer = []
    num_rows.times do |i|
      column = []
      num_rows.times do |j|
        column << matrix[j][i]
      end
      answer << column
    end
    return answer
  end

  def stock_picker(prices)
    dates = []
    profit = 0

    prices.length.times do |buy|
      ((buy + 1)...(prices.length)).each do |sell|
        # puts("buy =" + buy.to_s)
        # puts("sell = " + sell.to_s)
        # puts("profit = #{prices[sell] - prices[buy]}")
        if (prices[sell] - prices[buy]) > profit then
          dates = [buy, sell]
          profit = prices[sell] - prices[buy]
        end
      end
    end
    return dates
  end

def hanoi
  pegs = {
    "1" => [3, 2, 1],
    "2" => [],
    "3" => []
  }

  win_length = pegs["1"].length
  while true do
    p pegs

    puts "Take from which peg?"
    start = gets.chomp
    puts "Put on which peg?"
    destination = gets.chomp

    if valid?(pegs, start, destination) then
      move(pegs, start, destination)
      if won?(pegs, win_length)
        puts "Nice Job! You won."
        break
      end
    end

  end


end

def move(pegs, start, destination)
  pegs[destination] << pegs[start].pop
end

def won?(pegs, win_length)
  pegs["2"].length == win_length || pegs["3"].length == win_length
end

def valid?(pegs, start, destination)
  !pegs[start].empty? && (pegs[destination].empty? ||
  (pegs[destination][-1] > pegs[start][-1]))

end

if __FILE__ == $PROGRAM_NAME
  #puts [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
  #p [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
  # p my_transpose([
  #   [0, 1, 2],
  #   [3, 4, 5],
  #   [6, 7, 8]
  #   ])
    # => [[0, 3, 6],
    #    [1, 4, 7],
    #    [2, 5, 8]]

#  p stock_picker([10, 11, 12, 1, 10, 50, 10])
  #[3, 5]

  hanoi
end

def factors(num)
  result = []
  num.downto(1).each do |possible_factor|
    result << possible_factor if num % possible_factor == 0
  end

  result
end

def bubble_sort(nums)
  result = Array.new(nums)
  unsorted = true

  while unsorted
    unsorted = false
    result.length.times do |left|
      (left + 1).upto(result.length - 1).each do |right|
        if result[left] > result[right]
          result[left], result[right] = result[right], result[left]
          unsorted = true
        end
      end
    end
  end
  result
end

def substrings(str)
  results = []
  length = str.length

  0.upto(length).each do |start|
    1.upto(length - start).each do |sub_length|
      results << str[start, sub_length]
    end
  end

  results.uniq
end

def subwords(str)
  dictionary = File.readlines('dictionary.txt')
  dictionary.map!{ |line| line.chomp }

  substrings(str).select{ |substring| dictionary.include?(substring) }
end

if __FILE__ == $PROGRAM_NAME
  p bubble_sort([0,2,1,3])
end

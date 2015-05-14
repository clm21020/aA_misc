def times_2(arr)
  arr.map do |i|
    i*2
  end
end

class Array

  def my_each
    self.length.times do |i|
      yield(self[i])
    end
    return self
  end
end

def median(arr)
  length = arr.length
  arr.sort!
  if length % 2 == 0 then
    return (arr[length/2]+arr[length/2-1])/2
  else
    return arr[length/2]
  end
end

def concat_str(arr)
  arr.inject(:+)
end

if __FILE__ == $PROGRAM_NAME
  # arr = [1,2,3,4]
  # puts times_2(arr)

  # return_value = [1, 2, 3].my_each do |num|
  #   puts num
  # end.my_each do |num|
  #   puts num
  # end
  #
  # p return_value

  # odd = [5,7,2,10,20] #7
  # even = [5,7,2,10] #6
  #
  # p median(odd)
  # p median(even)

  p concat_str(["Yay ", "for ", "strings!"])
end

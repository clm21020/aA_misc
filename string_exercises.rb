NUMS = {
  0 => "0",
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  10 => "A",
  11 => "B",
  12 => "C",
  13 => "D",
  14 => "E",
  15 => "F",
}


def num_to_s(num, base)
  pow = 0
  output = ""
  until (num / (base ** pow) == 0)
    output = (NUMS[((num / (base ** pow)) % base)]) + output
    pow += 1
  end
  output
end

def caesar(str, shift)
  str_arr = str.split('')

  str_arr.map! do |i|
  curr_val = i.ord
    if curr_val > 96 && curr_val < 123 then
      shifted = curr_val + shift
      if shifted > 122 then shifted = 96 + (shifted % 122) end
      shifted.chr
    end
  end
  str_arr.join()
end

if __FILE__ == $PROGRAM_NAME
  # #num_to_s tests
  # puts num_to_s(5, 10) #=> "5"
  # puts num_to_s(5, 2)  #=> "101"
  # puts num_to_s(5, 16) #=> "5"
  # puts num_to_s(234, 10) #=> "234"
  # puts num_to_s(234, 2)  #=> "11101010"
  # puts num_to_s(234, 16) #=> "EA"

  puts caesar("hello", 3) # => "khoor"
  puts caesar("zany", 2) # => "bcpa"

end

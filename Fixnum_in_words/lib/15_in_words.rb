class Fixnum

  def in_words
    ones = {
      0 => '',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
    }

    teens = {
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
    }

    tens = {
      2 => 'twenty',
      3 => 'thirty',
      4 => 'forty',
      5 => 'fifty',
      6 => 'sixty',
      7 => 'seventy',
      8 => 'eighty',
      9 => 'ninety',
    }

    return "zero" if self == 0

    answer = ""
    numsleft = self

    if numsleft > 999_999_999_999
      answer << "#{(numsleft/1_000_000_000_000).in_words} trillion "
      numsleft %= 1_000_000_000_000
    end

    if numsleft > 999_999_999
      answer << "#{(numsleft/1_000_000_000).in_words} billion "
      numsleft %= 1_000_000_000
    end

    if numsleft > 999_999
      answer << "#{(numsleft/1_000_000).in_words} million "
      numsleft %= 1_000_000
    end

    if numsleft > 999
      answer << "#{(numsleft/1000).in_words} thousand "
      numsleft %= 1000
    end

    if numsleft > 99
      answer << "#{ones[numsleft/100]} hundred "
      numsleft %= 100
    end

    if numsleft > 19
      answer << "#{tens[numsleft / 10]} "
      numsleft %= 10
    end

    if numsleft > 9
      answer << teens[numsleft]
    else
      answer << ones[numsleft]
    end

    return answer.strip
  end

end

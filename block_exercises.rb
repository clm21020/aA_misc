class Array
  def my_each(&prc)
    length.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_map(&prc)
    result = []

    my_each do |el|
      result << prc.call(el)
    end

    result
  end

  def my_select(&prc)
    result = []

    my_each do |el|
      result << el if prc.call(el)
    end

    result
  end

  def my_inject(&prc)
    first_arg = self.first

    my_each do |el|
      first_arg = prc.call(first_arg, el)
    end

    first_arg
  end

  def my_sort!(&prc)
    sorted = false
    until sorted
      sorted = true
      (length - 1).times do |left|
        if prc.call(self[left], self[left + 1]) == 1
          self[left], self[left + 1] = self[left + 1], self[left]
          sorted = false
        end
      end
    end

    self
  end

  def my_sort(&prc)
    dup.my_sort!(&prc)
  end
end

def eval_block(*args, &prc)
  return "NO BLOCK GIVEN" if prc.nil?
  prc.call(*args)
end

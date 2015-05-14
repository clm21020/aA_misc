class MyHashSet
  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    @store.delete(el) ? true : false
  end

  def to_a
    @store.keys
  end

  def union(set2)
    @store.merge(set2.to_h)
  end

  def to_h
    @store
  end

  def intersect(set2)
    @store.keep_if do |key, val|
      set2.include?(key)
    end
  end

  def minus(set2)
    @store.delete_if do |key, val|
      set2.include?(key)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  set1 = MyHashSet.new
  set1.insert("1")
  set1.insert("2")
  set1.insert("3")
  #p set1

  set2 = MyHashSet.new
  set2.insert("4")
  set2.insert("2")
  set2.insert("3")
  #p set2

  # puts set1.include?("1")
  # puts set1.include?("f")

  # puts set1.delete("1")
  # puts set1.delete("f")

  # p set1.to_a
  # p set2.to_a

  #p set1.union(set2)

  #p set1.intersect(set2)

  p set1.minus(set2)

end

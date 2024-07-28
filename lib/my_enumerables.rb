module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elm in self do
      yield elm
    end
    self  
  end 

  def my_any?
    flag = false
    self.my_each do |elm|
      if yield(elm) 
        flag = true
        break
      end  
    end
    flag  
  end

  def my_count
    return self.length unless block_given?
    count = 0
    self.my_each do |elm|
      count += 1 if yield(elm) 
    end
    count
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self 
  end

  def my_inject acc = 0
    self.my_each do |cur|
      acc = yield(acc,cur)
    end
    acc
  end  

  def my_map 
    arr = []
    self.each { |elm| arr << yield(elm) }
    arr
  end

  def my_none?
    flag = true
    self.my_each do |elm|
      if yield(elm)
        flag = false
        break
      end
    end
    flag
  end

  def my_select
    arr = []
    self.each { |elm| arr << elm if yield(elm) }
    arr
  end

end

# Phase I
def my_min(array) # O(n^2)

  (0...array.length).each do |i|
    if array.none? { |el| array[i] > el }
      return array[i]
    end
  end


end

# Phase II

def my_min2(array) # O(n)
  current_min = array.first

  array.each do |el|
    if el < current_min
      current_min = el
    end
  end

  current_min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

# Phase I
def largest_contiguous_subsum(list) # O(n^2)
  subs_sums = []

  list.each_index do |i|
    list.each_index do |j|
      next if j < i
      subs_sums << list[i..j]
    end
  end

  highest_array_sum = nil
  subs_sums.each do |array|
    array_sum = array.reduce(:+)
    if highest_array_sum == nil || array_sum > highest_array_sum
      highest_array_sum = array_sum
    end
  end

  highest_array_sum
end

def largest_contiguous_subsum2(list)
  highest_sum = list.first
  current_sum = list.first

  list.each do |el|
    current_sum += el
    if current_sum > highest_sum
      highest_sum = current_sum
    elsif current_sum < 0
        current_sum = 0
    end
  end

  highest_sum
end

list = [5, 3, -7]
list1 = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => 8
p largest_contiguous_subsum2(list1) # => 8
p largest_contiguous_subsum2(list2) # => -1
p largest_contiguous_subsum2([1,2,-4,4,-3,4])

def first_anagram?(str1, str2) # O(n!)
  perms = str1.chars.permutation.to_a

  perms.map do |arr|
    arr.join
  end.each do |string|
    return true if string == str2
  end

  false
end

# p first_anagram?("cat", "act") # => true
# p first_anagram?("sup", "hey") # => false

def second_anagram?(str1, str2) # O(n)
  str1_arr = str1.chars
  str2_arr = str2.chars

  str1_arr.each do |el|
    idx = str2_arr.find_index(el)
    str2_arr.delete(str2_arr[idx]) unless idx.nil?
  end

  str2_arr.empty?
end

# p second_anagram?("cat", "act") # => true
# p second_anagram?("sup", "hey") # => false

def third_anagram?(str1, str2) # O(n^2)
  str1.chars.sort == str2.chars.sort
end
#
# p third_anagram?("cat", "act") # => true
# p third_anagram?("sup", "hey") # => false

def fourth_anagram?(str1, str2) # O(n)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |ch|
    hash1[ch] += 1
  end

  str2.each_char do |ch|
    hash2[ch] += 1
  end

  hash1 == hash2
end

def fourth_anagram2?(str1, str2)
  hash = Hash.new(0)

  str1.each_char do |ch|
    hash[ch] += 1
  end

  str2.each_char do |ch|
    hash[ch] -= 1
  end

  hash.values.all? { |v| v == 0 }
end

p fourth_anagram2?("cat", "act") # => true
p fourth_anagram2?("sup", "hey") # => false

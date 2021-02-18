hash_vowels = {}
array_vowels = ['a', 'o', 'e', 'u', 'i']
('a'..'z').each_with_index do |letter, index| 
  if array_vowels.include?(letter)
    hash_vowels[letter] = index + 1
    end
end
puts hash_vowels

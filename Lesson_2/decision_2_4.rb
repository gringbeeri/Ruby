hash_vowels = {}
array_vowels = %w[a o e u i]
('a'..'z').each_with_index do |letter, index|
  hash_vowels[letter] = index + 1 if array_vowels.include?(letter)
end
puts hash_vowels

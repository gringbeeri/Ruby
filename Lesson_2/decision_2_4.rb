hash_letters = {}
hash_vowels = {}
array_vowels = ['a', 'o', 'e', 'u', 'i']
('a'..'z').each_with_index do |letter, index|
  hash_letters[letter] = index + 1
  array_vowels.each do |vowels|
    hash_vowels[vowels] = hash_letters[vowels]
  end
end
puts hash_vowels

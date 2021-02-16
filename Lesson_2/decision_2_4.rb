hash_letters = {}
hash_vowels = {}
array_vowels = ['a', 'o', 'e', 'u', 'i']
letters = ('a'..'z').each_with_index do |key, value|
  hash_letters[key] = value + 1
end
array_vowels.each do |vowels|
  hash_vowels[vowels] = hash_letters[vowels]
end
puts hash_vowels

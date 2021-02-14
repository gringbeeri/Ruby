array = ['а', 'y', 'о', 'ы', 'и', 'э', 'я', 'ю', 'ё', 'у']
hash = {}
count = 0
array.each do |key|
  hash[key] = count += 1
end
puts hash

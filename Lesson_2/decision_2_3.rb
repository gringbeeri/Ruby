array = []
a, b = 0, 1
loop do
  break if b > 100
  a, b = b, a + b
  array << a
end
print array

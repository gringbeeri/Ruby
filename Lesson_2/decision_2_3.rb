a, b = 1, 1
loop do
  break if a > 100
  a, b = b, a + b
  print a.to_a
end

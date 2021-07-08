months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
result = 0
print 'Введите число? '
day = gets.to_i
result += day
print 'Введите месяц? '
month = gets.to_i
print 'Введите год? '
year = gets.to_i

(0..month - 2).each do |number|
  result += months[number]
end
if year % 4 == 0
  if year % 100 != 0
    result += 1
  elsif year % 100 == 0 && year % 400 == 0
    result += 1
  end
end
puts result

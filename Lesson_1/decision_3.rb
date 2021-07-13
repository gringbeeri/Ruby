print 'Введите сторону 1: '
side_1 = gets.to_f
print 'Введите сторону 2: '
side_2 = gets.to_f
print 'Введите сторону 3: '
side_3 = gets.to_f
list_side = [side_1, side_2, side_3].sort
max_side = list_side.pop
a, b = list_side
if (a + b) < max_side
  puts 'Треугольника не сущетсвует'
elsif a == b && a == max_side && b == max_side
  puts 'Треугольник равносторонний'
elsif a == b || a == max_side || b == max_side
  puts 'Треугольник равнобедренный'
elsif max_side**2 == a**2 + b**2
  puts 'Треугольник прямоугольный'
end

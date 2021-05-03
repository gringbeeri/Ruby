print "Введите значение a: "
a = gets.to_f
print "Введите значение b: "
b = gets.to_f
print "Введите значение c: "
c = gets.to_f
discr = b ** 2 - 4 * a * c
if discr > 0
  x_1 = (-b + Math.sqrt(discr)) / 2 * a
  puts "Первый корень: #{x_1}"
  x_2 = (-b - Math.sqrt(discr)) / 2 * a
  puts "Второй корень: #{x_2}"
elsif discr == 0
  x_1 = -b / 2 * a
  puts "Дискриминант равен: #{discr}, корень равен: #{x_1}"
else
  puts "Корней нету"
end

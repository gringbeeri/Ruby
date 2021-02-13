puts "Введите сторону 1:"
side_1 = gets.to_i
puts "Введите сторону 2:"
side_2 = gets.to_i
puts "Введите сторону 3:"
side_3 = gets.to_i
list_side = [side_1, side_2, side_3].sort
max_side = list_side.pop()
a, b = list_side
if (a.to_i + b.to_i) < max_side
    puts "Треугольника не сущетсвует"
elsif side_1 == side_2 && side_1 == side_3 && side_2 == side_3
    puts "Треугольник равносторонний"
elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
    puts "Треугольник равнобедренный"
elsif max_side ** 2 && a ** 2 + b ** 2
    puts "Треугольник прямоугольный"
end

    



    


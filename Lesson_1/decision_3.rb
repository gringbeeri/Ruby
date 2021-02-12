puts "Введите сторону 1:"
side_1 = gets.to_i
puts "Введите сторону 2:"
side_2 = gets.to_i
puts "Введите сторону 3:"
side_3 = gets.to_i
list_side = [side_1, side_2, side_3]
max_side = [side_1, side_2, side_3].max
list_side.delete(max_side)
a, b = list_side
if (a.to_i + b.to_i) < max_side
    puts "Треугольника не сущетсвует"
end

if side_1 && side_2 && side_3
    puts "Треугольник равносторонний"
elsif a && b || a && c || b && c
    puts "Треугольник равнобедренный"
elsif max_side ** 2 && a ** 2 + b ** 2
    puts "Треугольник прямоугольный"
end

    



    


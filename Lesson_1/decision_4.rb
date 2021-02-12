puts "Введите сторону a: "
a = gets.to_i
puts "Введите сторону b: "
b = gets.to_i
puts "Введите сторону c: "
c = gets.to_i
discr = (b ** 2 - 4 * a * c)
if discr > 0
    x_1 = ((-b + Math.sqrt(discr)) / (2 * a))
    puts "Первый корень: #{x_1}"
    x_2 = ((-b - Math.sqrt(discr)) / (2 * a))
    puts "Первый корень: #{x_2}"
    elsif discr == 0
        x_1 = (-b / (2 * a))
        puts "Дискриминант равен: #{discr}, корень равен: #{x_1}"
    elsif discr < 0
        puts "Корней нету"
        end
    

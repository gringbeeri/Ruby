puts "Как вас зовут?"
name = gets.chomp 
puts "Какой у вас возраст?"
growth = gets.to_f
weight = (growth - 110) * 1.15
if weight.to_f < 0
    puts "#{name} - Ваш вес уже оптимальный"
else
    puts "#{name} - Ваш вес составляет: #{weight}" 
end

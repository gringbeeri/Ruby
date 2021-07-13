print 'Как вас зовут? '
name = gets.chomp
print 'Какой у вас рост? '
growth = gets.to_f
weight = (growth - 110) * 1.15
if weight < 0
  puts "#{name} - Ваш вес уже оптимальный"
else
  puts "#{name} - Ваш идеальный вес составляет: #{weight}"
end

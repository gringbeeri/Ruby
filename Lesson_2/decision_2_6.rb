array_backet = []
total_amount = 0
loop do 
  print "Введите продукт: "
  product = gets.chomp
  break if product == 'stop'
    
  print "Введите цену за продукт: "
  price = gets.to_f

  print "Введите количетсво продуктов: "
  qty = gets.to_i

  hash_basket = {product => {'цена' => price, 'количество' => qty}}
  puts "Товар: #{product}, ценой #{price} с количеством #{qty}"
  array_backet.push hash_basket

  hash_basket.each do |key, value|
    result_price = value['цена']
    result_qty = value['количество']  
    result_summa = result_price.to_f * result_qty.to_i 
    total_amount += result_summa.to_f
    puts "Общая сумма товара #{product} равна: #{result_summa}" 
    puts "Общая итоговая сумма товара равна: #{total_amount}"
  end
end
puts array_backet

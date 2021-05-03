array_backet = []
item_amount = []
total_amount = 0
loop do 
  print "Введите продукт: "
  product = gets.chomp
  break if product == 'stop'
    
  print "Введите цену за продукт: "
  price = gets.to_f

  print "Введите количетсво продуктов: "
  qty = gets.to_i

  hash_basket = {product => {product_price: price, product_qty: qty}}
  puts "Товар: #{product}, ценой #{price} с количеством #{qty}"
  array_backet << hash_basket
end
array_backet.each do |products|
  products.each do |product, data_product|
    result_price = data_product[:product_price]
    result_qty = data_product[:product_qty]  
    result_summa = result_price.to_f * result_qty.to_f
    total_amount += result_summa.to_f
    result = "Общая сумма товара #{product} равна: #{result_summa}"
    item_amount << result
  end
end
puts array_backet
puts item_amount
puts "Общая итоговая сумма товара равна: #{total_amount}"

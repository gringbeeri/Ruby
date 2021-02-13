#1
array = (10..100).step(5)
puts array.to_a


#2
(10..100).step(5) do |numbers|
    array = [numbers]
    puts array.to_a
end

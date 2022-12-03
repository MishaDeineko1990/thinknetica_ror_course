cart = {}

loop do
  print "Enter goods name "
  goods_name = gets.chomp

  break if goods_name.downcase == "stop" ||  goods_name.downcase == "стоп" 

  print "Enter qvantyty goods "
  goods_quantity = gets.chomp.to_f

  print "Enter price goods "
  goods_price = gets.chomp.to_f 

  cart [goods_name] = { goods_quantity: goods_quantity, goods_price: goods_price }
  
  puts ""
end

puts ""
puts ""
puts "---------------CART-----------------"
puts "____________________________________"
puts ""

cart_total_price = 0

cart.each do |kay, value|
  puts "#{kay.inspect} #{value.inspect}"  
  puts "total price #{kay}: #{value[:goods_quantity] * value[:goods_price]}"
  cart_total_price += value[:goods_quantity] * value[:goods_price]
  puts ""
end 

puts "------------------------------------"
puts "TOTAL PRICE IN CART: #{cart_total_price}"
puts "------------------------------------"

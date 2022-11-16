require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"

seller = Seller.new("DIC Store")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("Memory", 13880, seller) }
10.times{ Item.new("motherboard", 28980, seller) }
10.times{ Item.new("Power supply unit", 8980, seller) }
10.times{ Item.new("PC case", 8727, seller) }
10.times{ Item.new("3.5 inch HDD", 10980, seller) }
10.times{ Item.new("2.5 inch SSD", 13370, seller) }
10.times{ Item.new("M.2 SSD", 12980, seller) }
10.times{ Item.new("CPU Cooler", 13400, seller) }
10.times{ Item.new("Graphic board", 23800, seller) }

puts "🤖 tell me your name"
customer = Customer.new(gets.chomp)

puts "🏧 Please enter the amount to top up your wallet"
customer.wallet.deposit(gets.chomp.to_i)

puts "🛍️ Start shopping"
end_shopping = false
while !end_shopping do
  puts "📜 Product list"
  seller.items_list

  puts "️️⛏ Please enter the item number"
  number = gets.to_i

  puts "⛏ Enter item quantity"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "🛒 cart contents"
  customer.cart.items_list
  puts "🤑 total amount: #{customer.cart.total_amount}"

  puts "😭 Do you want to finish shopping? (yes/no)"
  end_shopping = gets.chomp == "yes"
end

puts "💸 Confirm purchase? (yes/no)"
customer.cart.check_out if gets.chomp == "yes"

puts "21 Followers 21"
puts "️🛍️ ️#{customer.name} property"
customer.items_list
puts "😱👛 #{customer.name}'s wallet balance: #{customer.wallet.balance}"

puts "📦 #{seller.name} stock status"
seller.items_list
puts "😻👛 #{seller.name}'s wallet balance: #{seller.wallet.balance}"

puts "🛒 cart contents"
customer.cart.items_list
puts "🌚 total amount: #{customer.cart.total_amount}"

puts "🎉 end"

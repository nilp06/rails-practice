10.times do |i|
  Product.create(title: "Product#{i}", description: "discription of product#{i}", price: rand(500..700),
                 capacity: rand(100..300), is_active: [true, false].sample, status: %i[in_stock out_of_stock coming_soon].sample)
end

10.times do |i|
  Customer.create(first_name: "First Name#{i}", last_name: "Last Name#{i}", email: "customer#{i}@gmail.com",
                  phone_number: "9898#{i}3434#{i}")
end

50.times do |_i|
  Order.create(quantity: rand(1..100), product_id: Product.pluck(:id).sample, customer_id: Customer.pluck(:id).sample,
               status: %i[booked canceled].sample)
end

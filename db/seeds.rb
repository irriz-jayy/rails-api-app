# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating users..."
10.times do
    User.create(
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      username: Faker::Internet.user_name,
      password: Faker::Internet.password(min_length: 8)    
    )
  end
  
puts "Done"

puts "Creating brands..."
Product.create(brand:"Nike",name:"Air Jordan High", description:"Black and white classic jordans", image_url:"https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQglUooqW6KM91DQ_rDa7-8awAj_LZFNKdHj8KOml9WFcZuRb1Aem8A8dGSS8gRh2WoH2PRoj8CiyDsch7QSbgQNJ6AsOfQYO4oMybNpCLdY47ncA1NpKlXTA&usqp=CAc", price:2650,stock:"In stock" ,color:"black", size:10)
Product.create(brand:"Nike",name:"Max 90 cushion", description:"Best air maxes", image_url:"https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQpiG7vQrDiwK2DuTegcNXUW8N0se0ssPwRcKob_vZfUPlWAXQsZQ1AOOAcuhuZb8hb0j9aI1MHJ3zJNz28NDhF_XhmQmyoDGUzFPGxxOKf&usqp=CAc", price:1900,stock:"In stock" ,color:"black", size:10)
Product.create(brand:"Nike",name:"Air Jordan 1", description:"Low air jordans", image_url:"https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQiXVvbxtRwbKooYO1mLx1LGR89_FPhzn3RV-Mu7llFcv_mPao-GazFW9LZSLJgFtEsGHE1OLKP939gvBMHYnFzHe5sXLyZEZqjEmi2emCNZvK96Y8V27tq&usqp=CAc", price:3850,stock:"In stock",color:"black", size:10)
Product.create(brand:"Nike ",name:"Infinity run", description:"Running nike shoes", image_url:"https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/fb5ad585-ec9c-4ab6-ab6f-b0b6b50235a4/infinityrn-4-mens-road-running-shoes-4hKwJW.png", price:4000,stock:"In Stock",color:"black", size:10)
puts "Done"

puts "Creating orders..."
Order.create(user_id:1,product_id:1,quantity:2,status:"processing")
Order.create(user_id:4,product_id:3,quantity:1,status:"pending")
Order.create(user_id:6,product_id:2,quantity:3,status:"shipped")
Order.create(user_id:5,product_id:4,quantity:2,status:"delivered")
Order.create(user_id:10,product_id:4,quantity:2,status:"pending")
puts "Done"
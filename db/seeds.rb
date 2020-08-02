# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Destroy users, bookings, experiences and reviews"
Review.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?
Experience.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

# "users"
10.times do
    User.create!([{
      email: Faker::Internet.email,
      password: "123456",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    }])
  end

# "experiences"
# 10.times do
#     Experience.create!([{
#       user_id: Faker::Number.within(range: 1..10),
#       title: Faker::Company.catch_phrase,
#       experience_type: Faker::Educator.subject,
#       description: Faker::ChuckNorris.fact,
#       price: Faker::Number.within(range: 5..5000)
#     }])
#   end
# Experience.create(user_id:2, title: "Painting nature", experience_type: "painting", 
# description: "portrait artist of your holiday week", price:25)

# "bookings"
# Booking.create(user_id:2, experience_id: 2, booked: false)


# "reviews"
# Review.create(booking_id:2, rating:5, content: "Amazing!!!")



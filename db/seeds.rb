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
10.times do
    Experience.create!([{
      user_id: Faker::Number.within(range: (User.first.id)..(User.last.id)),
      title: Faker::Company.catch_phrase,
      experience_type: Faker::Educator.subject,
      description: Faker::ChuckNorris.fact,
      price: Faker::Number.within(range: 5..5000),
      address: Faker::Address.full_address
    }])
end

# "bookings"
10.times do
  Booking.create!([{
    user_id: Faker::Number.within(range: (User.first.id)..(User.last.id)),
    experience_id: Faker::Number.within(range: (Experience.first.id)..(Experience.last.id)),
    booked: false,
    starts_at: Faker::Date.between(from: Date.today, to: '2021-09-25'),
    ends_at: Faker::Date.between(from: Date.today, to: '2021-09-25')
  }])
end

# "reviews"
10.times do
  Review.create!([{
    booking_id: Faker::Number.unique.within(range: (Booking.first.id)..(Booking.last.id)),
    rating: Faker::Number.within(range: 1..5),
    content: Faker::Kpop.i_groups
  }])
end

puts "Created new users, bookings, experiences and reviews"

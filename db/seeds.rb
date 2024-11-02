require "faker"

puts "Emptying INTERNSHIPS database..."
Internship.destroy_all

puts "Seeding internships..."
10.times do
  Internship.create(
    title: Faker::Job.title,
    role: Faker::Job.position,
    description: Faker::Company.catch_phrase,
    location: Faker::Address.city,
    start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: '2025-01-30', to: '2025-07-31'),
    compensation: "$10",
    user_id: 1
  )
end

puts "Complete!"

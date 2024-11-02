require "faker"

puts "Emptying INTERNSHIPS database..."
Internship.destroy_all

puts "Emptying USERS database..."
User.destroy_all
puts "Creating EMPLOYER 1 - Abby Chamber..."
User.create(
  id: 1,
  email: "abbychamber@gmail.com",
  password: "123456",
  user_type: "employer",
  first_name: "Abby",
  last_name: "Chamber",
  industry: "Finance",
  contact_number: "0412345678",
  location: "Melbourne",
)
puts "Creating EMPLOYER 2 - Harry Potter..."
User.create(
  id: 2,
  email: "harrypotter@gmail.com",
  password: "123456",
  user_type: "employer",
  first_name: "Harry",
  last_name: "Potter",
  industry: "Technology",
  contact_number: "0499999999",
  location: "Sydney",
)

puts "Creating APPLICANT 1 - Homer Simpson..."
User.create(
  id: 3,
  email: "homersimpson@gmail.com",
  password: "123456",
  user_type: "applicant",
  first_name: "Homer",
  last_name: "Simpson",
  industry: "Food",
  contact_number: "0411223344",
  location: "Brisbane",
)

puts "Creating APPLICANT 2 - Bella Swan..."
User.create(
  id: 4,
  email: "bellaswan@gmail.com",
  password: "123456",
  user_type: "applicant",
  first_name: "Bella",
  last_name: "Swan",
  industry: "Finance",
  contact_number: "0400000000",
  location: "Melbourne",
)

puts "Seeding internships..."
10.times do
  Internship.create(
    title: Faker::Job.title,
    role: Faker::Job.position,
    description: Faker::Company.catch_phrase,
    location: Faker::Address.city,
    start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: '2025-01-30', to: '2025-07-31'),
    compensation: rand(0..10) * 1000,
    user_id: rand(2)
  )
end

puts "Complete!"

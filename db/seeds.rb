require "faker"

puts "Emptying INTERNSHIPS database..."
Internship.destroy_all

puts "Emptying USERS database..."
  User.destroy_all

image_array = ["abby.jpg", "harry.jpg", "homer.jpg", "bella.jpg"]

file_path_1 = Rails.root.join("app/assets/images/#{image_array[0]}")
file_1 = File.open(file_path_1)
puts "Creating EMPLOYER 1 - Abby Chamber..."
abby = User.create(
  email: "abbychamber@gmail.com",
  password: "123456",
  user_type: 0,
  first_name: "Abby",
  last_name: "Chamber",
  industry: "Finance",
  contact_number: "0412345678",
  location: "Melbourne",
)
abby.profile_picture.attach(io: file_1, filename: image_array[0], content_type: "image/png")
abby.save
file_1.close

file_path_2 = Rails.root.join("app/assets/images/#{image_array[1]}")
file_2 = File.open(file_path_2)
puts "Creating EMPLOYER 2 - Harry Potter..."
harry = User.new(
  email: "harrypotter@gmail.com",
  password: "123456",
  user_type: 0,
  first_name: "Harry",
  last_name: "Potter",
  industry: "Technology",
  contact_number: "0499999999",
  location: "Sydney",
)
harry.profile_picture.attach(io: file_2, filename: image_array[1], content_type: "image/png")
harry.save
file_2.close

file_path_3 = Rails.root.join("app/assets/images/#{image_array[2]}")
file_3 = File.open(file_path_3)
puts "Creating APPLICANT 1 - Homer Simpson..."
homer = User.create(
  email: "homersimpson@gmail.com",
  password: "123456",
  user_type: 1,
  first_name: "Homer",
  last_name: "Simpson",
  industry: "Food",
  contact_number: "0411223344",
  location: "Brisbane",
)
homer.profile_picture.attach(io: file_3, filename: image_array[2], content_type: "image/png")
homer.save
file_3.close

file_path_4 = Rails.root.join("app/assets/images/#{image_array[3]}")
file_4 = File.open(file_path_4)
puts "Creating APPLICANT 2 - Bella Swan..."
bella = User.create(
  email: "bellaswan@gmail.com",
  password: "123456",
  user_type: 1,
  first_name: "Bella",
  last_name: "Swan",
  industry: "Finance",
  contact_number: "0400000000",
  location: "Melbourne",
)
bella.profile_picture.attach(io: file_4, filename: image_array[3], content_type: "image/png")
bella.save
file_4.close

employers = [abby, harry]
applicants = [homer, bella]

puts "Seeding internships..."
10.times do
  internship = Internship.new(
    title: Faker::Job.title,
    role: Faker::Job.position,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    location: Faker::Address.city,
    start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: '2025-01-30', to: '2025-07-31'),
    compensation: rand(0..10) * 1000,
    user: employers.sample
  )
  if internship.save
    puts internship.title
  else
    puts internship.errors.full_messages
  end
end

puts "Seeding internship applications..."
InternshipApplication.create(
  application_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  status: :Pending,
  internship_id: rand(Internship.first.id..Internship.last.id),
  user: applicants.sample,
  comment: Faker::Lorem.paragraph(sentence_count: 4)
)
InternshipApplication.create(
  application_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
  status: :Pending,
  internship_id: rand(Internship.first.id..Internship.last.id),
  user: applicants.sample,
  comment: Faker::Lorem.paragraph(sentence_count: 4)
)

puts "Complete!"

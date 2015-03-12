# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    current_location: Faker::Address.city,
    campus: Faker::Address.city,
    bio: Faker::Hacker.say_something_smart,
    )
end

20.times do
  Post.create(
    title: Faker::App.name,
    content: Faker::Lorem.paragraphs(2),
    user_id: Faker::Number.number(2)
    )
end

20.times do
  Job.create(
    company: Faker::Company.name,
    description: Faker::Lorem.paragraphs(1),
    contact: Faker::Name.name,
    job_title: Faker::Lorem.word,
    user_id: Faker::Number.number(2),
    location: Faker::Address.city,
    job_type: "Full-Time",
    created_at: 20141204000000
    )
end

20.times do
  Event.create(
    event_name: Faker::Company.name,
    event_description: Faker::Lorem.paragraphs(1),
    event_date: Faker::Time.forward(30),
    user_id: Faker::Number.number(2),
    event_site: Faker::Company.name,
    event_time: '7:30 PM',
    event_location: Faker::Address.city,
    )
end

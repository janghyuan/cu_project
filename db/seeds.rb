# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'janghuan',
  nickname: '张欢',
  email: 'janghuan@gmail.com',
  password: 'foobar',
  password_confirmation: 'foobar',
  admin: true
)

User.create!(
  name: 'janglyang',
  nickname: '张译',
  email: 'janglyang@gmail.com',
  password: 'foobar',
  password_confirmation: 'foobar',
)

15.times do |n|
    name = Faker::Name.unique.first_name
    User.create!(
      name: name,
      nickname: name,
      email: name + "@example.com",
      password: 'foobar',
      password_confirmation: 'foobar'
    )
end

User.all.each do |user|
  20.times do |n|
    user.reports.create!(
      content: Faker::Lorem.paragraph(2),
      created_at: n.to_i.week.ago,
      updated_at: n.to_i.week.ago
    )
  end
end
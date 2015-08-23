# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
6.times do
  Post.create!(title: Faker::Lorem.sentence(3), 
               short: Faker::Lorem.sentence(10),
               content:  Faker::Lorem.paragraph(5),
               tags: Faker::Lorem.word,
               status: 1,
               created_at: Faker::Date.between(2.days.ago, Date.today),
               updated_at: Faker::Date.between(2.days.ago, Date.today),
               user_id: 1
               )
end
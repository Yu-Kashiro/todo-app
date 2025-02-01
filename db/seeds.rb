# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# john = User.create(email: 'john@example.com', password: 'password')
# emily = User.create(email: 'emily@example.com', password: 'password')
# sample = User.create(email: 'sample@sample.com', password: '.gfBziAd3PatFR')

3.times do
  Board.create!(
    title: Faker::JapaneseMedia::Naruto.character,
    content: Faker::Lorem.sentence(word_count: 30),
    deadline: Faker::Date.between(from: '2025-01-01', to: '2025-12-31'),
    user_id: 3
  )
end

3.times do
  Board.create!(
    title: Faker::JapaneseMedia::Naruto.character,
    content: Faker::Lorem.sentence(word_count: 30),
    deadline: Faker::Date.between(from: '2025-01-01', to: '2025-12-31'),
    user_id: 4
  )
end

3.times do
  Board.create!(
    title: Faker::JapaneseMedia::Naruto.character,
    content: Faker::Lorem.sentence(word_count: 30),
    deadline: Faker::Date.between(from: '2025-01-01', to: '2025-12-31'),
    user_id: 5
  )
end


# 10.times do
#   Task.create!(
#     title: Faker::JapaneseMedia::Naruto.character,
#     content: Faker::Lorem.sentence(word_count: 100),
#     user_id: 3,
#     board_id: 44,
#     deadline: Faker::Date.birthday(min_age: 18, max_age: 65)
#     )
# end

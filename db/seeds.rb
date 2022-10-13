require 'faker'

# 4.times do |id|
#   f_name = Faker::Name.unique.name
#   User.create(
#     name: f_name,
#     email: Faker::Internet.email(name: f_name),
#     password: "yaya_#{id}",
#     password_confirmation: "yaya_#{id}",
#   )
# end
6.times do |id|
  Category.create(
    name: Faker::Book.genre
  )
end
users_ids = User.pluck(:id)
categories_ids = Category.pluck(:id)

30.times do |num|
  Post.create(title: Faker::Book.title,
              body: Faker::Quotes::Shakespeare.king_richard_iii_quote,
              user_id: users_ids.sample,
              category_id: categories_ids.sample)
end
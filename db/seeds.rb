
require 'faker'

4.times do |id|
  f_name = Faker::Name.unique.name
  User.create(
    name: f_name,
    email: Faker::Internet.email(name: f_name),
    password:"yaya_#{id}",
    password_confirmation:"yaya_#{id}",
  )
end
ids = User.pluck(:id)


10.times do |num|
  Post.create(title:Faker::Book.title,
              body:Faker::Quotes::Shakespeare.king_richard_iii_quote,
              user_id:ids.sample)
end
5.times do
  user = User.create({ name: Faker::Name.name })
  5.times do
    user.posts.create({ title: Faker::Book.title, body: Faker::Lorem.sentence })
  end
end

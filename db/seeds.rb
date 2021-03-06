# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

owners = []
5.times do
  owners << User.create!(username: Faker::Name.name)
end

true_false = [true,false]
contacts = []
5.times do |t|
  contacts << Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    owner:  owners[rand(2)],
    is_favorite: true_false.sample
  )
end

owners.each do |owner|
  3.times do
    ContactShare.create(
    user: owner,
    contact: owner.contacts.sample,
    is_favorite: true_false.sample)
  end
end

7.times do
  Comment.create(
    author: owners.sample,
    comment_body: Faker::Hipster.paragraph,
    voiceable: (Contact.all + User.all).sample
    )
end

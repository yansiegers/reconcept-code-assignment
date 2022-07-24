# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Yan Siegers', email: 'hello@yansiegers.nl')
user2 = User.create(name: 'Jürgen Visser', email: 'jurgen@reconcept.nl')
user3 = User.create(name: 'Mattijs Soeters', email: 'mattijs@reconcept.nl')

message1 = user1.messages.create(content: 'This project is made for Reconcept.')
message2 = user1.messages.create(content: 'I have used Postman to test the API.')
message3 = user1.messages.create(content: 'The project can be found on GitHub.')
message4 = user2.messages.create(content: 'Hi, I am Jürgen.')
message5 = user3.messages.create(content: 'Hi, I am Mattijs.')

tag1 = Tag.create(name: 'ruby')
tag2 = Tag.create(name: 'rails')
tag3 = Tag.create(name: 'api')
tag4 = Tag.create(name: 'postman')
tag5 = Tag.create(name: 'github')
tag6 = Tag.create(name: 'reconcept')

message1.tags << [tag1, tag2, tag6]
message2.tags << [tag1, tag2, tag3, tag4, tag5]
message3.tags << [tag2, tag3, tag5]
message4.tags << tag6
message5.tags << tag6

require 'faker'

user = User.create(username: "gaba", password: "123", password_confirmation: "123", avatar: Faker::Avatar.image, first_name: "Justin", last_name: "Gaba", email: "gaba@gaba.com")
user2 = User.create(username: "eligaba", password: "123", password_confirmation: "123", avatar: Faker::Avatar.image, first_name: "Eli", last_name: "Gaba", email: "eligaba@gaba.com")

event = Event.create(user_id: user.id, title: "BBQ + Ranger Game", description: "Come join us for some good dogs and Hockey Action!", event_date: DateTime.parse('2015-03-11 13:30:00'))
collaborator = Collaborator.create(user_id: user.id, event_id: event.id, guest_num: 4)
collaborator2 = Collaborator.create(user_id: user2.id, event_id: event.id, guest_num: 4)

comment = Comment.create(user_id: user.id, event_id: event.id, content: "I can't wait for this event")



4.times do 

user3 = User.create(username: Faker::Internet.user_name, password: "123", password_confirmation: "123", avatar: Faker::Avatar.image, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email)

end
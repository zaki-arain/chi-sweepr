User.delete_all

100.times do
    User.create(
        username: Faker::StarWars.character,
        email: Faker::Internet.email,
        password: Faker::Internet.password
        )
end

    User.create(username: "seaweed_master", email: "mail@example", password: "1234")

 

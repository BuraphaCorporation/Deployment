
# role of user
['user', 'organizer', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.create(
  email:                 "arnon@hongklay.com",
  password:              "1234567890",
  password_confirmation: "1234567890"
)


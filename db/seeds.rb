
# role of user
['user', 'organizer', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.first_or_create do |user|
  user.email                 = 'arnon@hongklay.com',
  user.password              = '1234567890',
  user.password_confirmation = '1234567890',
  user.confirmed_at          = Tome.zone.now
end


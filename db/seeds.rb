
# role of user
['user', 'organizer', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.create do |user|
  user.email                 = 'arnon@hongklay.com'
  user.password              = '1234567890'
  user.password_confirmation = '1234567890'
  user.confirmed_at          = Time.zone.now
end

User.create do |user|
  user.email                 = 'hello@daydash.co'
  user.password              = 'ddaSh#2020'
  user.password_confirmation = 'ddaSh#2020'
  user.confirmed_at          = Time.zone.now
end

User.create do |user|
  user.email                 = 'daydash.app@gmail.com'
  user.password              = 'ddaSh#2020'
  user.password_confirmation = 'ddaSh#2020'
  user.confirmed_at          = Time.zone.now
end

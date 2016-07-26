
# role of user
['user', 'organizer', 'moderator', 'management'].each do |role|
  Role.find_or_create_by({title: role})
end

['Nightlife / Entertainment', 'Art & Culture', 'Sport & Wellness', 'Food & Drink'].each do |category|
  Category.find_or_create_by({title: category})
end

['food', 'music', 'theatre', 'movies', 'bars', 'party', 'comedy', 'shows', 'live', 'beer', 'wine', 'drinks dance', 'dj', 'jazz', 'adventure', 'sports', 'fitness', 'festival', 'outdoors', 'gym', 'culture', 'performance', 'film', 'hipster', 'art', 'design', 'exhibition', 'photography', 'wellness', 'healthy', 'games', 'extreme', 'relaxing',
 'afterwork', 'family', 'date', 'romantic', 'group', 'popup', 'trip', 'workshop', 'class', 'training', 'single', 'night', 'day'].each do |tag|
  Tag.find_or_create_by({title: tag})
end

# User.create do |user|
#   user.email                 = 'arnon@hongklay.com'
#   user.first_name            = 'Arnon'
#   user.last_name             = 'Hongklay'
#   user.password              = '1234567890'
#   user.password_confirmation = '1234567890'
#   user.confirmed_at          = Time.zone.now
#   user.role_id               = Role.find_by_name('management').id
# end

# User.create do |user|
#   user.email                 = 'hello@daydash.co'
#   user.first_name            = 'management'
#   user.last_name             = 'daydash'
#   user.password              = 'ddaSh#2020'
#   user.password_confirmation = 'ddaSh#2020'
#   user.confirmed_at          = Time.zone.now
#   user.role_id               = Role.find_by_name('moderator').id
# end
#
# User.create do |user|
#   user.email                 = 'daydash.app@gmail.com'
#   user.first_name            = 'organizer'
#   user.last_name             = 'daydash'
#   user.password              = 'ddaSh#2020'
#   user.password_confirmation = 'ddaSh#2020'
#   user.confirmed_at          = Time.zone.now
#   user.role_id               = Role.find_by_name('organizer').id
# end

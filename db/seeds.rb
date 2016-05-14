
user = User.new(
    :email                 => "arnon@hongklay.com",
    :password              => "123456",
    :password_confirmation => "123456"
)
user.skip_confirmation!
user.save!

class Wishlist < ActiveRecord::Base
  has_many :users
  has_many :events
end

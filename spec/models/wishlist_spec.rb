# == Schema Information
#
# Table name: wishlists
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

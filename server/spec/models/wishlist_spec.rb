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
# Indexes
#
#  index_wishlists_on_event_id  (event_id)
#  index_wishlists_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_060dd988b8  (event_id => events.id)
#  fk_rails_eb66139660  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

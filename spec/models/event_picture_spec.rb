# == Schema Information
#
# Table name: event_pictures
#
#  id                 :integer          not null, primary key
#  event_id           :integer
#  sort_index         :integer          default(100)
#  media_file_name    :string
#  media_content_type :string
#  media_file_size    :integer
#  media_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_event_pictures_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_8b0a9f6d41  (event_id => events.id)
#

require 'rails_helper'

RSpec.describe EventPicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

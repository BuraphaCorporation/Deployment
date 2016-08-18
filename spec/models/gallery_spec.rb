# == Schema Information
#
# Table name: galleries
#
#  id                 :integer          not null, primary key
#  event_id           :integer
#  media_file_name    :string
#  media_content_type :string
#  media_file_size    :integer
#  media_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Gallery, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

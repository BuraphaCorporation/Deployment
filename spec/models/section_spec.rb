# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  status     :string
#  event_id   :integer
#  title      :string
#  event_time :datetime
#  end_time   :datetime
#  price      :integer
#  total      :integer          default(0)
#  bought     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  unit       :integer          default(1)
#
# Indexes
#
#  index_sections_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_3fc873a652  (event_id => events.id)
#

require 'rails_helper'

RSpec.describe Section, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

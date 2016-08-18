# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  status     :integer          default("off")
#  event_id   :integer
#  title      :string
#  event_time :datetime
#  end_time   :datetime
#  price      :integer
#  available  :integer          default(0)
#  bought     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Section, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  status     :integer          default("passed")
#  user_id    :integer
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payment_id :integer
#  event_id   :integer
#  section_id :integer
#

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

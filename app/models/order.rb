# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  extend Enumerize

  has_many :tickets, dependent: :destroy

  def to_s
    "##{no}"
  end

private

end

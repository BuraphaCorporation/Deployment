# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  slug       :string
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#

class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :events
end

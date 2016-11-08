# == Schema Information
#
# Table name: events
#
#  id                        :integer          not null, primary key
#  user_id                   :integer
#  title                     :string
#  description               :text
#  instruction               :text
#  location_name             :string
#  location_address          :string
#  latitude                  :decimal(10, 6)
#  longitude                 :decimal(10, 6)
#  uptime                    :datetime
#  max_price                 :integer
#  min_price                 :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  slug                      :string
#  name                      :string
#  ticket_type               :string
#  status                    :string
#  show_highlight            :boolean          default(FALSE)
#  total_of_ticket           :integer          default(0)
#  share_ticket              :boolean          default(FALSE)
#  cover_file_name           :string
#  cover_content_type        :string
#  cover_file_size           :integer
#  cover_updated_at          :datetime
#  short_description         :text
#  social_share_file_name    :string
#  social_share_content_type :string
#  social_share_file_size    :integer
#  social_share_updated_at   :datetime
#  whythis                   :text
#
# Indexes
#
#  index_events_on_slug     (slug) UNIQUE
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_0cb5590091  (user_id => users.id)
#

class EventSerializer < ActiveModel::Serializer
  attributes :user_id, :title, :description, :price, :created_at, :updated_at
end

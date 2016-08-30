# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  gender                 :boolean
#  birthday               :date
#  phone                  :string
#  interesting            :string
#  company                :string
#  url                    :string
#  short_description      :text
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  role_id                :integer
#  picture_file_name       :string
#  picture_content_type    :string
#  picture_file_size       :integer
#  picture_updated_at      :datetime
#  token                  :string
#  referal_code           :string
#  referrer_id            :integer
#  onesignal_id           :string
#  customer_token         :string
#

FactoryGirl.define do
  factory :user do
    
  end
end

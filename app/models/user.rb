# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  birthday               :date
#  phone                  :string
#  picture_file_name      :string
#  picture_content_type   :string
#  picture_file_size      :integer
#  picture_updated_at     :datetime
#  role                   :string
#  provider               :string
#  uid                    :string
#  access_token           :string
#  omise_customer_id      :string
#  onesignal_id           :string
#  company                :string
#  url                    :string
#  interest               :string
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
#  referal_code           :string
#  referrer_id            :integer
#  slug                   :string
#  latitude               :decimal(10, 6)
#  longitude              :decimal(10, 6)
#  facebook               :string
#  twitter                :string
#  instagram              :string
#  youtube                :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_referrer_id           (referrer_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  belongs_to :referrer, class_name: 'User', inverse_of: :referrals

  has_many :events, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :referrals, class_name: 'User', foreign_key: :referrer_id, inverse_of: :referrer

  # has_one :token, { order 'created_at DESC' }, class_name: Doorkeeper::AccessToken, foreign_key: :resource_owner_id

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100#" },
                    default_url: "#{App.domain}/src/images/profile/missing-profile.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  before_create :set_default_access_token
  before_create :set_default_referal
  after_create :set_customer_token
  after_create :send_welcome_email

  scope :latest, -> { order 'created_at desc' }
  enumerize :gender, in: [:male, :female, :not_specify], default: :not_specify #default: lambda { |user| SexIdentifier.sex_for_name(user.name).to_sym }
  enumerize :role, in: [:user, :organizer, :admin], default: :user

  def admin?
    role == 'admin'
  end

  def organizer?
    role == 'organizer'
  end

  def can_organizer?
    role != 'user'
  end

  def date_of_birth
    birthday.try(:strftime, "%d/%m/%Y")
  end

  def self.organizer
    self.where(role: 'organizer')
  end

  def self.from_oauth_api(token)
    graph = Koala::Facebook::API.new(token)
    profile = graph.get_object("me?fields=id,email,first_name,last_name,birthday,about,gender,location")
    image = graph.get_picture(profile['id'], type: :large)

    if find_by_email(profile['email']).nil?
      where(provider: 'facebook', uid: profile['id']).first_or_create(
        email:      profile['email'],
        password:   Devise.friendly_token[0,20],
        first_name: profile['first_name'],
        last_name:  profile['last_name'],
        birthday:   process_date_of_birth(profile['birthday']),
        gender:     profile['gender'],
        picture:    process_uri(image)
      )
    else
      where(email: profile['email']).update(
        provider:   'facebook',
        uid:        profile['id'],
        first_name: profile['first_name'],
        last_name:  profile['last_name'],
        birthday:   process_date_of_birth(profile['birthday']),
        gender:     profile['gender'],
        picture:    process_uri(image)
      ).first
    end
  end

  def self.from_omniauth(auth)
    if find_by(uid: auth.uid).nil?
      where(provider: auth.provider, uid: auth.uid).first_or_create(
        email:      auth.extra.raw_info.email,
        password:   Devise.friendly_token[0,20],
        first_name: auth.extra.raw_info.first_name,
        last_name:  auth.extra.raw_info.last_name,
        birthday:   process_date_of_birth(auth.extra.raw_info.birthday),
        gender:     auth.extra.raw_info.gender,
        picture:    process_uri(auth.info.image)
      )
    else
      where(uid: auth.uid).update(
        first_name: auth.extra.raw_info.first_name,
        last_name:  auth.extra.raw_info.last_name,
        birthday:   process_date_of_birth(auth.extra.raw_info.birthday),
        gender:     auth.extra.raw_info.gender,
        picture:    process_uri(auth.info.image)
      ).first
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.process_date_of_birth(data)
    p "process_date_of_birth data #{data}"
    date = data.split('/')
    date = Date.new(date[2].to_i, date[0].to_i, date[1].to_i)
  end

  def self.process_uri(uri)
    open(uri, allow_redirections: :safe) { |r| r.base_uri.to_s }
  end

  def self.valid_signup?(email, password)
    User.find_by_email(email).valid_password?(password)
  end

  def self.valid_token?(token)
    User.find_by_token(token)
  end

protected
  def confirmation_required?
    false
  end

private
  def generate_token
    loop do
      access_token = SecureRandom.base64.tr('+/=', 'Qrt')
      break access_token unless User.exists?(access_token: access_token)
    end
  end

  def set_default_access_token
    self.access_token = generate_token
  rescue Exception => e
    logger.warn e
  end

  def generate_referal
    loop do
      referal_code = App.generate_code
      break referal_code unless User.exists?(referal_code: referal_code)
    end
  end

  def set_default_referal
    self.referal_code = generate_referal
  rescue Exception => e
    logger.warn e
  end

  def set_customer_token
    customer = Omise::Customer.create({
      email: self.email,
      description: "id: #{self.id} - name: #{self.first_name} #{self.last_name}"
    })
    self.update(omise_customer_id: customer.id)
  rescue Exception => e
    logger.warn e
  end

  def send_welcome_email
    UserWelcomeWorker.perform_async(self.id)
  end
end

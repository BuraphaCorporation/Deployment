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
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  token                  :string
#  referal_code           :string
#  referrer_id            :integer
#  onesignal_id           :string
#  customer_token         :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_referrer_id           (referrer_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role_id               (role_id)
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_642f17018b  (role_id => roles.id)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook] #, :async

  belongs_to :role
  belongs_to :referrer, class_name: 'User', inverse_of: :referrals

  has_many :events, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :referrals, class_name: 'User', foreign_key: :referrer_id, inverse_of: :referrer

  # has_one :token, { order 'created_at DESC' }, class_name: Doorkeeper::AccessToken, foreign_key: :resource_owner_id

  enum gender: { male: true, female: false }

  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "100x100#" },
                    default_url: "#{App.domain}/src/images/profile/missing-profile.png"

  validates_attachment_content_type :avatar,
                                    content_type: /\Aimage\/.*\Z/

  before_create :set_default_role
  before_create do |user|
    user.token        = user.generate_token
    user.referal_code = user.default_referal
  end
  after_create :create_customer_token
  after_create :send_welcome_mail

  def generate_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(token: token)
    end
  end

  def default_referal
    loop do
      referal_code = App.generate_code
      break referal_code unless User.exists?(referal_code: referal_code)
    end
  end

  def create_customer_token
    begin
      customer = Omise::Customer.create({
        email: self.email,
        description: "#{self.first_name} #{self.last_name} id: #{self.id}"
      })
      self.update(customer_token: customer.id)
    rescue Exception => e
      logger.warn e
    end
  end

  def send_welcome_mail
    UserMailer.welcome(self).deliver
  end

  def is_admin?
    role.title == 'admin'
  end

  def is_organizer?
    role.title == 'organizer'
  end

  def can_organizer?
    role.title != 'user'
  end

  def self.from_api(token)
    graph = Koala::Facebook::API.new(token)
    profile = graph.get_object("me?fields=id,email,first_name,last_name,birthday,about,gender,location")
    image = graph.get_picture(profile['id'], type: :large)

    where(provider: 'facebook', uid: profile['id']).first_or_create(
      email:      profile['email'],
      password:   Devise.friendly_token[0,20],
      first_name: profile['first_name'],
      last_name:  profile['last_name'],
      birthday:   profile['birthday'],
      gender:     profile['gender'],
      avatar:     process_uri(image)
    )
  end

  def self.from_omniauth(auth)
    if where(email: auth.extra.raw_info.email).present?
      update(
        provider:   auth.provider,
        uid:        auth.uid,
        first_name: auth.extra.raw_info.first_name,
        last_name:  auth.extra.raw_info.last_name,
        birthday:   auth.extra.raw_info.birthday,
        gender:     auth.extra.raw_info.gender,
        avatar:     process_uri(auth.info.image)
      ).first
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create(
        email:      auth.extra.raw_info.email,
        password:   Devise.friendly_token[0,20],
        first_name: auth.extra.raw_info.first_name,
        last_name:  auth.extra.raw_info.last_name,
        birthday:   auth.extra.raw_info.birthday,
        gender:     auth.extra.raw_info.gender,
        avatar:     process_uri(auth.info.image)
      )
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
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
    def set_default_role
      self.role ||= Role.find_by_title('user')
    end
end

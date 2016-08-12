
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

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
                    default_url: '/defalut/:attachment/missing_user.png'

  validates_attachment_content_type :avatar,
                                    content_type: /\Aimage\/.*\Z/

  before_create :set_default_role
  before_create do |user|
    user.token        = user.generate_token
    user.referal_code = user.default_referal
  end

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

  # def is_management?
  #   role.title == 'management'
  # end

  # def is_moderator?
  #   role.title == 'moderator'
  # end

  def is_organizer?
    role.title == 'admin'
  end

  def can_organizer?
    role.title = 'admin'
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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :events
  belongs_to :role

  enum gender: { male: 1, female: 0 }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100#" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar,
                                    content_type: /\Aimage\/.*\Z/

  before_create :set_default_role

  before_create do |user|
    user.token = user.generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(token: token)
    end
  end

  def admin?
    role.name == 'admin'
  end

  def moderator?
    role.name == 'moderator'
  end

  def organizer?
    role.name == 'organizer'
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name, user.last_name = auth.info.name.split(" ")
      user.avatar = process_uri(auth.info.image)
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

protected

  def confirmation_required?
    false
  end

private

  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end

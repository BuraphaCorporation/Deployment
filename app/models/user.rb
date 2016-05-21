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


  def admin?
    role.name == 'admin'
  end

  def moderator?
    role.name == 'moderator'
  end

  def organizer?
    role.name == 'organizer'
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

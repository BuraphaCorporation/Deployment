class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, # :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  belongs_to :role
  before_create :set_default_role


protected
  def confirmation_required?
    false
  end

private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end

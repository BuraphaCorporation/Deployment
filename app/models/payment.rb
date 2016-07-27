class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  enum status: { active: 0, archived: 1 }

  has_attached_file :evidence, styles: { "600x700" }

end

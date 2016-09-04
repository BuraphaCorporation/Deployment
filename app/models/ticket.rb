# == Schema Information
#
# Table name: tickets
#
#  id                   :integer          not null, primary key
#  status               :string
#  code                 :string
#  qr_code_file_name    :string
#  qr_code_content_type :string
#  qr_code_file_size    :integer
#  qr_code_updated_at   :datetime
#  user_id              :integer
#  event_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  section_id           :integer
#  order_id             :integer
#  price                :integer
#  stages               :string
#
# Indexes
#
#  index_tickets_on_event_id    (event_id)
#  index_tickets_on_order_id    (order_id)
#  index_tickets_on_section_id  (section_id)
#  index_tickets_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_4def87ea62  (event_id => events.id)
#  fk_rails_538a036fb9  (user_id => users.id)
#  fk_rails_c6410ba81d  (order_id => orders.id)
#  fk_rails_e59379c902  (section_id => sections.id)
#

class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :section
  belongs_to :order

  has_attached_file :qr_code, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :qr_code, content_type: /\Aimage\/.*\z/

  before_create :set_default_ticket_code
  after_create :set_default_ticket_qr_code

  enumerize :stages, in: [:active, :passed], default: :active
  enumerize :status, in: [:available, :used], default: :available

  scope :current_tickets, -> { joins(:section).select{ |s| s.section.event_time >= Date.today } }
  scope :active, -> { includes(:section).where(stages: :active).order("sections.event_time asc") }
  scope :passed, -> { includes(:section).where(stages: :passed).order("sections.event_time desc") }

@users = User.includes(:user_extension).order("user_extensions.company desc")

  def to_s
    "#TK-#{code}"
  end

  def to_price
    '%.2f' % (price.to_f / 100)
  end

  class << self
    def create_ticket(user, order, event, section)
      create(stages: :active, user: user, order: order, event: event, section_id: section.id, price: section.price)
    rescue Exception => error
      error
    end

    # def consume_ticket(ticket)
    #   find(ticket).update(status: 2)
    # end

    # def event_passed(ticket)
    #   find(ticket).update(status: 0)
    # end
  end

private
  def generate_code
    loop do
      code = App.generate_code
      break code unless Ticket.exists?(code: code)
    end
  end

  def set_default_ticket_code
    self.code = generate_code
  end

  def set_default_ticket_qr_code
    attachment   = App.generate_qr_code(self)
    self.update(qr_code: File.open(attachment, 'rb'))
  end
end

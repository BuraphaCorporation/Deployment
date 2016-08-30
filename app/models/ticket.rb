# == Schema Information
#
# Table name: tickets
#
#  id                   :integer          not null, primary key
#  status               :integer          default("passed")
#  user_id              :integer
#  event_id             :integer
#  code                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  payment_id           :integer
#  section_id           :integer
#  qr_code_file_name    :string
#  qr_code_content_type :string
#  qr_code_file_size    :integer
#  qr_code_updated_at   :datetime
#
# Indexes
#
#  index_tickets_on_event_id    (event_id)
#  index_tickets_on_payment_id  (payment_id)
#  index_tickets_on_section_id  (section_id)
#  index_tickets_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_4def87ea62  (event_id => events.id)
#  fk_rails_538a036fb9  (user_id => users.id)
#  fk_rails_9092443286  (payment_id => payments.id)
#  fk_rails_e59379c902  (section_id => sections.id)
#

class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :section
  belongs_to :user
  belongs_to :payment

  enum status: { passed: 0, upcoming: 1, comsume: 2 }

  has_attached_file :qr_code, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :qr_code, content_type: /\Aimage\/.*\z/

  scope :current_tickets, -> { joins(:section).select{ |s| s.section.event_time >= Date.today } }

  before_create do |ticket|
    ticket.code = Ticket.code
  end
  after_create :generate_qr_code

  def generate_qr_code
    attachment = App.generate_qr_code(self)
    self.qr_code = File.open(attachment, 'rb')
  end


  class << self
    def code
      loop do
        code = App.generate_code
        break code unless exists?(code: code)
      end
    end

    def create_ticket(user, event, section, payment)
      begin
        create(status: 1, event_id: event.id, section_id: section, user_id: user.id, payment_id: payment.id)
      rescue Exception => e
        e
      end
    end

    def consume_ticket(ticket)
      find(ticket).update(status: 2)
    end

    def event_passed(ticket)
      find(ticket).update(status: 0)
    end
  end
end

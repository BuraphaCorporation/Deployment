class Entities::PaymentTransferExpose < Grape::Entity
  expose :code
  expose :status
  expose :event,    using: Entities::TicketDetailEventExpose
  expose :user,     using: Entities::TicketDetailUserExpose
  expose :tickets,  using: Entities::PaymentSectionExpose
  expose :expired_time do |item, option|
    item.created_at + 1.hours
  end
end

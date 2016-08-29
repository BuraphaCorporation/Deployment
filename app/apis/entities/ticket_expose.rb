class Entities::TicketExpose < Grape::Entity
  expose :id
  expose :code
  expose :status
  expose :event,    using: Entities::TicketDetailEventExpose
  expose :user,     using: Entities::TicketDetailUserExpose
  expose :tickets, as: :tickets,  using: Entities::PaymentSectionExpose
  expose :expired_time do |item, option|
    item.created_at.utc.iso8601 + 1.hours
  end
end

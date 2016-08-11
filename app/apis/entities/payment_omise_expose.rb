class Entities::PaymentOmiseExpose < Grape::Entity
  expose :code
  expose :status
  expose :event,    using: Entities::TicketDetailEventExpose
  expose :user,     using: Entities::TicketDetailUserExpose
  expose :tickets,  using: Entities::PaymentSectionExpose
end

class Entities::PaymentOmiseExpose < Grape::Entity
  expose :code
  expose :status
  expose :tickets, using: Entities::PaymentOmiseSectionExpose
  expose :tickets, using: Entities::TicketExpose
end

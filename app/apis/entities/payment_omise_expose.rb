class Entities::PaymentOmiseExpose < Grape::Entity
  expose :code
  expose :status
  expose :tickets, using: Entities::TicketExpose
end

class Entities::PaymentTransferExpose < Grape::Entity
  expose :code
  expose :status
  expose :tickets, using: Entities::PaymentSectionExpose
  expose :tickets, using: Entities::TicketExpose
end

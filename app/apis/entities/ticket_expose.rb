class Entities::TicketExpose < Grape::Entity
  expose :id
  expose :status, as: :ticket_status
  expose :code, as: :ticket_code
  # expose :event, using: Entities::EventExpose
  #   "#{item.inspect}"
  # end
  expose :section, using: Entities::SectionExpose
  expose :payment, using: Entities::PaymentExpose
end

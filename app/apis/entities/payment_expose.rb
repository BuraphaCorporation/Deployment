class Entities::PaymentExpose < Grape::Entity
  expose :id
  expose :code, as: :payment_code
  expose :status, as: :payment_status
  expose :provider
  # expose :amount
end

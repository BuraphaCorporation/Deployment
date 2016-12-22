class Entities::PaymentSectionExpose < Grape::Entity
  expose :id
  expose :status, as: :ticket_status
  expose :code, as: :ticket_code
  expose :section, as: :price do |item, option|
    item.section.price
  end
  expose :section, as: :title do |item, option|
    item.section.title
  end
  expose :section, as: :event_time do |item, option|
    item.section.event_time.utc.iso8601
  end
  expose :section, as: :end_time do |item, option|
    item.section.end_time.utc.iso8601
  end
end

class Entities::SectionExpose < Grape::Entity
  expose :id
  expose :title
  expose :price
  expose :event_time do |item|
    item.event_time.utc.iso8601
  end
  expose :end_time do |item|
    item.end_time.utc.iso8601
  end
end

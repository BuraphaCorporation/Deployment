class Entities::SectionExpose < Grape::Entity
  expose :id
  expose :price
  expose :event_time
  expose :end_time
end

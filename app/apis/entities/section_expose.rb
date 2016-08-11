class Entities::SectionExpose < Grape::Entity
  expose :id
  expose :title
  expose :price
  expose :event_time
  expose :end_time
end

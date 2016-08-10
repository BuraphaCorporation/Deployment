class Entities::PaymentSectionExpose < Grape::Entity
  expose :section, using: Entities::SectionExpose
end

class Entities::PaymentOmiseSectionExpose < Grape::Entity
  expose :section, using: Entities::SectionExpose
end

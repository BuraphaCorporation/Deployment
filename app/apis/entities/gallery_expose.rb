class Entities::GalleryExpose < Grape::Entity
  expose :media, as: :src do |item, options|
    "#{item.media(:thumb)}"
  end
end

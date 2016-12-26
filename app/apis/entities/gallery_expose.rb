class Entities::GalleryExpose < Grape::Entity
  expose :media, as: :src do |item, options|
    "#{item.media(:thumb)}"
  end
  expose :media, as: :flag do |item, options|
    "#{item.media_content_type}"
  end
end

json.array! @images do |image|
  json.id         image.id
  json.sort_index image.sort_index
  json.media      image.media(:thumb)
end

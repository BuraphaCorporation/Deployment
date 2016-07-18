class Gallery < ApplicationRecord
  belongs_to :event

  has_attached_file :media,
   styles: { medium: "500x300>", thumb: "100x50#" },
   path: ":rails_root/public/images/:id/:filename",
   url: "/images/:id/:filename"

  do_not_validate_attachment_file_type :media
end

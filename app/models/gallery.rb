
class Gallery < ApplicationRecord
  belongs_to :event

  has_attached_file :media,
    styles: lambda { |a|
      if a.instance.is_image?
        {
          full:     "1600x555#",
          normal2x: "750x590#",
          normal3x: "1125x885#",
          thumb2x:  "750x450#",
          thumb3x:  "1125x675#",
          thumb:    '800x500#',
          facebook: "1200x630"
        }
      else
        {
          thumb:  { geometry: "800x500#", format: 'jpg', time: 10 },
          normal: { geometry: "1125x885#", format: 'jpg', time: 10}
        }
      end
    },
    processors: lambda { |a|
      a.is_image? ? [ :ffmpeg ] : [ :thumbnail ]
    },
    path: ":rails_root/public/images/:id/:filename",
    url: "/images/:id/:filename"

  do_not_validate_attachment_file_type :media

  def is_image?
    return true if self.media_content_type == 'image/jpg'
  end
end

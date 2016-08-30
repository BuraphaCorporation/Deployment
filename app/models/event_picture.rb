# == Schema Information
#
# Table name: event_pictures
#
#  id                 :integer          not null, primary key
#  event_id           :integer
#  sort_index         :integer          default(100)
#  media_file_name    :string
#  media_content_type :string
#  media_file_size    :integer
#  media_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_event_pictures_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_8b0a9f6d41  (event_id => events.id)
#

class EventPicture < ApplicationRecord
  belongs_to :event

  has_attached_file :media,
    styles: {
              full:     "1600x650#",
              normal2x: "750x590#",
              normal3x: "1125x885#",
              thumb2x:  "750x450#",
              thumb3x:  "1125x675#",
              thumb:    '800x500#',
              facebook: "1200x630#"
            }
    # styles: lambda { |a|
    #   if a.instance.is_image?
    #     {
    #       full:     "1600x650#",
    #       normal2x: "750x590#",
    #       normal3x: "1125x885#",
    #       thumb2x:  "750x450#",
    #       thumb3x:  "1125x675#",
    #       thumb:    '800x500#',
    #       facebook: "1200x630"
    #     }
    #   else
    #     {
    #       thumb:  { geometry: "800x500#", format: 'jpg', time: 10 },
    #       normal: { geometry: "1125x885#", format: 'jpg', time: 10}
    #     }
    #   end
    # },
    # processors: lambda { |a|
    #   a.is_image? ? [ :ffmpeg ] : [ :thumbnail ]
    # }
    # path: ":rails_root/public/images/:id/:filename",
    # url: "/images/:id/:filename"

  do_not_validate_attachment_file_type :media

  def is_image?
    return true if self.media_content_type == 'image/jpg'
  end
end

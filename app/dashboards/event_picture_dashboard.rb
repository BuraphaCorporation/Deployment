require 'admin/base_dashboard'

class EventPictureDashboard < Admin::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Admin::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    event: Field::BelongsTo,
    id: Field::Number,
    sort_index: Field::Number,
    media_file_name: Field::String,
    media_content_type: Field::String,
    media_file_size: Field::Number,
    media_updated_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :event,
    :id,
    :sort_index,
    :media_file_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :event,
    :id,
    :sort_index,
    :media_file_name,
    :media_content_type,
    :media_file_size,
    :media_updated_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :event,
    :sort_index,
    :media_file_name,
    :media_content_type,
    :media_file_size,
    :media_updated_at,
  ].freeze

  # Overwrite this method to customize how event pictures are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event_picture)
  #   "EventPicture ##{event_picture.id}"
  # end
end

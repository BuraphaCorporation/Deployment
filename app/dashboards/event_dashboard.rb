require 'admin/base_dashboard'

class EventDashboard < Admin::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Admin::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    category: Field::BelongsTo,
    categories: Field::HasMany,
    wishlists: Field::HasMany,
    event_pictures: Field::HasMany,
    orders: Field::HasMany,
    tickets: Field::HasMany,
    sections: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    instruction: Field::Text,
    location_name: Field::String,
    location_address: Field::String,
    latitude: Field::String.with_options(searchable: false),
    longitude: Field::String.with_options(searchable: false),
    uptime: Field::DateTime,
    max_price: Field::Number,
    min_price: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    name: Field::String,
    ticket_type: Field::String,
    status: Field::String,
    show_highlight: Field::Boolean,
    total_of_ticket: Field::Number,
    share_ticket: Field::Boolean,
    cover_file_name: Field::String,
    cover_content_type: Field::String,
    cover_file_size: Field::Number,
    cover_updated_at: Field::DateTime,
    short_description: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :category,
    :categories,
    :wishlists,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :category,
    :categories,
    :wishlists,
    :event_pictures,
    :orders,
    :tickets,
    :sections,
    :id,
    :title,
    :description,
    :instruction,
    :location_name,
    :location_address,
    :latitude,
    :longitude,
    :uptime,
    :max_price,
    :min_price,
    :created_at,
    :updated_at,
    :slug,
    :name,
    :ticket_type,
    :status,
    :show_highlight,
    :total_of_ticket,
    :share_ticket,
    :cover_file_name,
    :cover_content_type,
    :cover_file_size,
    :cover_updated_at,
    :short_description,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :category,
    :categories,
    :wishlists,
    :event_pictures,
    :orders,
    :tickets,
    :sections,
    :title,
    :description,
    :instruction,
    :location_name,
    :location_address,
    :latitude,
    :longitude,
    :uptime,
    :max_price,
    :min_price,
    :slug,
    :name,
    :ticket_type,
    :status,
    :show_highlight,
    :total_of_ticket,
    :share_ticket,
    :cover_file_name,
    :cover_content_type,
    :cover_file_size,
    :cover_updated_at,
    :short_description,
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event)
  #   "Event ##{event.id}"
  # end
end

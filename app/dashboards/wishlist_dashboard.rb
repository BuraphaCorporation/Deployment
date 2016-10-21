require 'admin/base_dashboard'

class WishlistDashboard < Admin::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Admin::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    events: Field::HasMany,
    id: Field::Number,
    event_id: Field::Number,
    user_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :users,
    :events,
    :id,
    :event_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :events,
    :id,
    :event_id,
    :user_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :events,
    :event_id,
    :user_id,
  ].freeze

  # Overwrite this method to customize how wishlists are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(wishlist)
  #   "Wishlist ##{wishlist.id}"
  # end
end

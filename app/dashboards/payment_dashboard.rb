require 'admin/base_dashboard'

class PaymentDashboard < Admin::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Admin::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    order: Field::BelongsTo,
    id: Field::Number,
    status: Field::String,
    methods: Field::String,
    omise_transaction_id: Field::String,
    amount: Field::Number,
    fee: Field::Number,
    slip_file_name: Field::String,
    slip_content_type: Field::String,
    slip_file_size: Field::Number,
    slip_updated_at: Field::DateTime,
    approved_at: Field::DateTime,
    paid_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :order,
    :id,
    :status,
    :methods,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :order,
    :id,
    :status,
    :methods,
    :omise_transaction_id,
    :amount,
    :fee,
    :slip_file_name,
    :slip_content_type,
    :slip_file_size,
    :slip_updated_at,
    :approved_at,
    :paid_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :order,
    :status,
    :methods,
    :omise_transaction_id,
    :amount,
    :fee,
    :slip_file_name,
    :slip_content_type,
    :slip_file_size,
    :slip_updated_at,
    :approved_at,
    :paid_at,
  ].freeze

  # Overwrite this method to customize how payments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment)
  #   "Payment ##{payment.id}"
  # end
end

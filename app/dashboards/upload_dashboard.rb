# frozen_string_literal: true
require 'administrate/base_dashboard'

class UploadDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    attachment: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    deleted_at: Field::DateTime,
    content_type: Field::String,
    size: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :name,
    :attachment
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :name,
    :attachment,
    :created_at,
    :updated_at,
    :deleted_at,
    :content_type,
    :size
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :name,
    :attachment,
    :deleted_at,
    :content_type,
    :size
  ].freeze

  # Overwrite this method to customize how uploads are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(upload)
  #   "Upload ##{upload.id}"
  # end
end

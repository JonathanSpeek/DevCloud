# frozen_string_literal: true
# Notes model
class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  acts_as_paranoid

  validates_presence_of :title, :user_id, :folder_id
end

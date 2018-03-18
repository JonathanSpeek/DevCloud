# frozen_string_literal: true
# Notes model
class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  acts_as_paranoid
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :title, :user_id, :folder_id

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end

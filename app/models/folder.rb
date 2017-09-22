# frozen_string_literal: true
# Folders hold uploads and notes
class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :uploads, :notes

  def self.search(search)
    where('name LIKE ?', "%#{search}%", "%#{search}%")
  end
end

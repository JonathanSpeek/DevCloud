# Notes model
class Note < ActiveRecord::Base
  belongs_to :user
  acts_as_paranoid

  def self.search(search)
    where('title LIKE ? OR content LIKE ? ', "%#{search}%", "%#{search}%")
  end
end

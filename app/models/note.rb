class Note < ActiveRecord::Base
  belongs_to :user
  acts_as_paranoid

  def self.search(search)
    where('title ILIKE ? OR content ILIKE ? ', "%#{search}%", "%#{search}%")
  end
end

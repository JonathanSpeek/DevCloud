class Note < ActiveRecord::Base
  belongs_to :user
  acts_as_paranoid
end

# frozen_string_literal: true
# Uploads model
class Upload < ActiveRecord::Base
  acts_as_paranoid
  mount_uploader :attachment, AttachmentUploader
  belongs_to :user
  belongs_to :folder

  before_save :data_limit_check

  validates_presence_of :name, :user_id, :folder_id, :size

  FREE = 5_000_000_000
  PREMIUM = 10_000_000_000

  def data_limit_check
    size = self.size.to_i
    total_size_after = user.total_data + size
    if user.subscription == 'free'
      false if FREE <= total_size_after
    elsif user.subscription == 'premium'
      false if PREMIUM <= total_size_after
    else
      false
    end
  end
end

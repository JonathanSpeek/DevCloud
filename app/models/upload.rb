# Uploads model
class Upload < ActiveRecord::Base
  acts_as_paranoid
  mount_uploader :attachment, AttachmentUploader
  belongs_to :user

  before_save :data_limit_check

  FREE = 5000000000
  PREMIUM = 10000000000

  def data_limit_check
    size = self.size.to_i
    total_size_after = user.total_data + size
    if user.subscription =='free'
      if FREE <= total_size_after
        false
      end
    elsif user.subscription =='premium'
      if PREMIUM <= total_size_after
        false
      end
    else
      false
    end
  end
end

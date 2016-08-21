class Upload < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :user
end

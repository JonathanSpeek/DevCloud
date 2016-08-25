class Upload < ActiveRecord::Base
  acts_as_paranoid
  mount_uploader :attachment, AttachmentUploader
  belongs_to :user
end

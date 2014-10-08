class Attachment < ActiveRecord::Base
  belongs_to :user

  has_attached_file :item
  do_not_validate_attachment_file_type :item
end

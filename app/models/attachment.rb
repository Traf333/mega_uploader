class Attachment < ActiveRecord::Base
  belongs_to :user

  has_attached_file :item
  do_not_validate_attachment_file_type :item

  before_create :default_title

  def default_title
    self.title = File.basename(item_file_name, '.*').titleize if item
  end



end

class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :attachments, through: :taggings

end

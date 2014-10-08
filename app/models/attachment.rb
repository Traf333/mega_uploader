class Attachment < ActiveRecord::Base

  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :item
  do_not_validate_attachment_file_type :item

  before_create :default_title

  def default_title
    self.title = File.basename(item_file_name, '.*').titleize if item
  end


  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end.uniq
  end


end

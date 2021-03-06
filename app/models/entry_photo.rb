class EntryPhoto < ActiveRecord::Base
  attr_accessible :entry_id, :photo
  has_attached_file :photo, :styles => { :medium => "400x400>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
    
  belongs_to :imageable, polymorphic: true
  belongs_to :user

  scope :not_linked, where(imageable_id: nil)
end

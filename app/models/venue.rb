class Venue < ActiveRecord::Base
  geocoded_by :address   # can also be an IP address
  after_validation :geocode

  attr_accessible :address, :capasity, :description, :metro, :price, :title, :working_time, :event_type_ids #, :user_id
  validates :title, :address, :description, presence: true

  has_many :events
  has_many :entry_photos, foreign_key: 'entry_id'
  has_and_belongs_to_many :event_types
  belongs_to  :user

  scope :visible, where(visible: true)
  scope :popular, order(:created_at)
end

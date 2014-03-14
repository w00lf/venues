class Event < ActiveRecord::Base
  attr_accessible :description, :hours, :start_at, :title #, :user_id, :venue_id

  has_many :entry_photos, as: :imageable
  has_and_belongs_to_many :event_types
  belongs_to :venue
  belongs_to  :user

  scope :popular, order(:created_at)
end

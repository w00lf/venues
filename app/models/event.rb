class Event < ActiveRecord::Base
  attr_accessible :description, :title, :venue_id
  belongs_to :venue
  has_many :entry_photos, foreign_key: 'entry_id'
end

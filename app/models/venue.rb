class Venue < ActiveRecord::Base
  attr_accessible :address, :capasity, :description, :equipment, :price, :time_from, :time_to, :title
  has_many :events
  has_many :entry_photos, foreign_key: 'entry_id'
end

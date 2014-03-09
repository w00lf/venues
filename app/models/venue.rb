class Venue < ActiveRecord::Base
  attr_accessible :address, :capasity, :description, :equipment, :price, :time_from, :time_to, :title
  has_many :events
  has_many :entry_photos, foreign_key: 'entry_id'
  has_many :users, through: :events
  scope :popular, order(created_at: 'desc')
end

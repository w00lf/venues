class Event < ActiveRecord::Base
  attr_accessible :description, :title, :venue_id
  belongs_to :venue
  has_many :entry_photos, foreign_key: 'entry_id'
  has_and_belongs_to_many :users
  scope :popular, 	joins('join events_users on events_users.event_id = events.id')
  					.group('events_users.event_id')
  					.order('count(user_id) DESC')
end

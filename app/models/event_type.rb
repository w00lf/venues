class EventType < ActiveRecord::Base
  attr_accessible :title

  has_and_belongs_to_many :venues
  has_and_belongs_to_many :events
end

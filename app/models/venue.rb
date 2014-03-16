class Venue < ActiveRecord::Base
  geocoded_by :address   # can also be an IP address
  after_validation :geocode

  attr_accessible :address, 
                  :capasity, 
                  :description, 
                  :metro, 
                  :district,
                  :price, 
                  :price_room,
                  :title, 
                  :working_time, 
                  :event_type_ids, 
                  :entry_photo_ids #, :user_id
  validates :title, :address, presence: true #:description,
  validates :title, :uniqueness => true
  validate :price_filled

  has_many :events
  has_many :entry_photos, as: :imageable
  has_and_belongs_to_many :event_types
  belongs_to  :user

  scope :visible, where(visible: true)
  scope :popular, order(:created_at)

  def price_filled
    errors.add(:price, I18n::t('errors.prices_all_blank')) if price_room.blank? && price.blank?
  end
end

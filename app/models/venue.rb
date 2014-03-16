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
  numeracly = lambda { |n| {format:{ with: /\s|\d|,|\./, message: I18n::t('errors.messages.not_a_number') }, if: n } }
  
  validates :price, numeracly.call('price.present?')
  validates :price_room, numeracly.call('price_room.present?') 
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

  def self.change_price_format(entry)
    entry.gsub(/\s/, '').gsub(/,/, '.').to_f
  end
end

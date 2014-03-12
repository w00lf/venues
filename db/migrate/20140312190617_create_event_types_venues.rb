class CreateEventTypesVenues < ActiveRecord::Migration
  def change
    create_table :event_types_venues, id: false do |t|
      t.integer :venue_id
      t.integer :event_type_id
    end
  end
end

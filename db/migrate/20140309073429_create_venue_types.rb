class CreateVenueTypes < ActiveRecord::Migration
  def change
    create_table :venue_types do |t|
      t.string :name
      t.integer :venue_id

      t.timestamps
    end
  end
end

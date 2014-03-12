class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.datetime :start_at
      t.string :hours
      t.integer :venue_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

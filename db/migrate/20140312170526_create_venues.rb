class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :title
      t.text :description
      t.integer :capasity
      t.string :price
      t.string :working_time
      t.string :address
      t.string :metro
      t.boolean :visible
      t.integer :user_id

      t.timestamps
    end
  end
end

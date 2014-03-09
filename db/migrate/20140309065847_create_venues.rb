class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :capasity
      t.datetime :time_from
      t.datetime :time_to
      t.string :address
      t.string :equipment
      t.integer :user_id

      t.timestamps
    end
  end
end

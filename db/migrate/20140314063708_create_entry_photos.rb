class CreateEntryPhotos < ActiveRecord::Migration
  def change 
    create_table :entry_photos do |t|
      t.integer :user_id
      t.attachment :photo
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps
    end
  end
end

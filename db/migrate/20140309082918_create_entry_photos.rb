class CreateEntryPhotos < ActiveRecord::Migration
  def change
    create_table :entry_photos do |t|
    	t.attachment :photo
    	t.integer :entry_id
      	t.timestamps
    end

  end
end

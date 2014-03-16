class AddDistrictPriceRoomToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :district, :string
    add_column :venues, :price_room, :integer
    change_column :venues, :price,  :integer
  end
end

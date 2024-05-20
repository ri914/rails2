class AddRoomTypeIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_type_id, :integer
  end
end

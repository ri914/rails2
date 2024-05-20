class AddForeignKeyToReservations < ActiveRecord::Migration[6.1]
  def change
    # 存在しないroom_idを参照するレコードがある場合、このマイグレーションは失敗するので、まずそれらのレコードを修正または削除する必要があります。
    add_foreign_key :reservations, :rooms
  end
end
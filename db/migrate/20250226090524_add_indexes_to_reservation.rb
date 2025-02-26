class AddIndexesToReservation < ActiveRecord::Migration[7.1]
  def change
    add_index :reservations, [:user_id, :property_id, :check_in_date, :check_out_date], unique: true, name: 'unique_reservations'
  end
end

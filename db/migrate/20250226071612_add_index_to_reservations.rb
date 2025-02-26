class AddIndexToReservations < ActiveRecord::Migration[7.1]
  def change
    add_index :reservations, [:check_in_date, :check_out_date], unique: true
  end
end

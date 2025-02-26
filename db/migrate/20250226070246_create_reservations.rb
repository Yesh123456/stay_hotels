class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date

      t.timestamps
    end
    add_index :reservations, [:user_id, :property_id], unique: true
  end
end

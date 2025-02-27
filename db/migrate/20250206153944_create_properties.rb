class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :long_title
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end

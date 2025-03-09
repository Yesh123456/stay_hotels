class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.references :property, null: false, foreign_key: true
      t.string :languages_spoken, array: true, default: []
      t.string :accessibility, array: true, default: []
      t.string :internet_access, array: true, default: []
      t.string :cleanliness_and_safety, array: true, default: []
      t.string :food_and_dinning, array: true, default: []
      t.string :access, array: true, default: []
      t.string :services_and_conveniences, array: true, default: []
      t.string :getting_around, array: true, default: []

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :location_rating
      t.integer :service_rating
      t.integer :room_comfort_quality_rating
      t.integer :cleanliness_rating
      t.integer :facilities_rating
      t.integer :value_for_money_rating
      t.decimal :final_rating
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end

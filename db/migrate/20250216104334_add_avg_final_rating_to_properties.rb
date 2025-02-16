class AddAvgFinalRatingToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :avg_final_rating, :decimal
  end
end

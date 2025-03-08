class Review < ApplicationRecord
  belongs_to :user
  belongs_to :property, counter_cache: true

  validates :content, presence: true
  validates :location_rating, numericality: { only_numeric: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :service_rating, numericality: { only_numeric: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11 }
  validates :room_comfort_quality_rating, numericality: { only_numeric: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11 }
  validates :cleanliness_rating, numericality: { only_numeric: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11 }
  validates :facilities_rating, numericality: { only_numeric: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11 }
  validates :value_for_money_rating, numericality: { only_numeric: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 11 }

  after_commit :update_final_rating, on:[:create,:update]

  def update_final_rating
    total_ratings_count = self.location_rating + 
    self.service_rating + 
    self.room_comfort_quality_rating + 
    self.cleanliness_rating + 
    self.facilities_rating + 
    self.value_for_money_rating

    self.final_rating = ((total_ratings_count / 6.0).to_f.round(2))
    update_column(:final_rating, self.final_rating)
    property.update_average_final_rating
  end

  def reviews_count
    self.reviews.count
  end

end

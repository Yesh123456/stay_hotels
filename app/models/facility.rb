class Facility < ApplicationRecord
  belongs_to :property

  # Optional: Validations to ensure arrays have values if needed
  validates :languages_spoken, :accessibility, :internet_access, 
            :cleanliness_and_safety, :food_and_dinning, 
            :access, :services_and_conveniences, :getting_around, 
            presence: true, allow_blank: true


  def highlighted_facilities
    KeywordExtractor.extract_highlighted_facilities(self)
  end

end


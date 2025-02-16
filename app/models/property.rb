class Property < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :address_line_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :country, presence: true
	monetize :price_cents, allow_nil: true

	has_many_attached :images 
	has_many :reviews, dependent: :destroy

	def update_average_final_rating
		avg_rating = (self.reviews.average(:final_rating)).to_f
		update_columns(avg_final_rating: avg_rating)
	end
end
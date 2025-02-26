class Property < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :address_line_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :country, presence: true
	monetize :price_cents, allow_nil: true

	has_many_attached :images 
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorite_users, through: :favorites, source: :user, dependent: :destroy
	has_many :reservations, dependent: :destroy
    has_many :reserved_users, through: :reservations, source: :property, dependent: :destroy

	def update_average_final_rating
		avg_rating = (self.reviews.average(:final_rating)).to_f
		update_columns(avg_final_rating: avg_rating)
	end

	def favorite_by?(user=nil)
		return if user.nil?
		favorite_users.include?(user)
	end

	def available_dates
	  current_res = reservations.ongoing_reservations.first
	  next_res = reservations.upcoming_reservations.first

	  from_date = current_res&.check_out_date || Date.tomorrow
	  to_date = next_res&.check_in_date || (Date.today + 20.days)

	  "#{from_date.strftime('%d %b')} - #{to_date.strftime('%d %b')}"
	end

end
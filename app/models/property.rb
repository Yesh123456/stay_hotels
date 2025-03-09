class Property < ApplicationRecord
    
    attribute :additional_attributes, :jsonb, default: {}
    validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :address_line_1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :country, presence: true
	validates :additional_attributes, presence: true, if: -> { additional_attributes.is_a?(Hash) }
	monetize :price_cents, allow_nil: true

	has_many_attached :images 
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorite_users, through: :favorites, source: :user, dependent: :destroy
	has_many :reservations, dependent: :destroy
    has_many :reserved_users, through: :reservations, source: :property, dependent: :destroy
    has_one :facility, dependent: :destroy

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

	def additional_attributes_with_check_in_check_out
		self.additional_attributes["check_in_check_out"]
	end

	def additional_attributes_with_extras
		self.additional_attributes["extras"]
	end

	def additional_attributes_with_the_property
		self.additional_attributes["the_property"]
	end

	def additional_attributes_with_getting_around
		self.additional_attributes["getting_around"]
	end

end
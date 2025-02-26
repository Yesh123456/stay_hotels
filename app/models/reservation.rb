class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true, comparison: { greater_than: :check_in_date }

  scope :upcoming_reservations, -> { where("check_in_date > ?", Date.today).order(:check_in_date) }
  scope :ongoing_reservations, -> { where("check_out_date >= ?", Date.today).where("check_in_date <= ?", Date.today).order(:check_out_date) }
end

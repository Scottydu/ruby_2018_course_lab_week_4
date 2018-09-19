class Person < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :country_code, presence: true, inclusion: { in: Country.all_codes }
  has_many :participations
  has_many :movies, through: :participations
end

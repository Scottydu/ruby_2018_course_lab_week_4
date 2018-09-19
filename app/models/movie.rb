class Movie < ApplicationRecord
  validates :year, :name, presence: true
  validates :name, uniqueness: true
  validate :has_one_director
  has_many :participations
  has_many :people, through: :participations

  private

  def has_one_director
    return if participations.where(role: 'director').count <= 1
    errors.add(:participations, 'A movie should have just one director')
  end
end

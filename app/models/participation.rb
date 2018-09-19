class Participation < ApplicationRecord
  ROLES = ['actor', 'director'].freeze
  belongs_to :movie
  belongs_to :person

  validates :role, presence: true, inclusion: { in: ROLES }
  validates :movie, :person, presence: true
  validates :movie, uniqueness: { scope: :person }
end

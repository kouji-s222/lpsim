class Income < ApplicationRecord
  belongs_to :user
  validates :total_income, presence: true
end

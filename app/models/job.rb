class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :categories
  belongs_to :company
end

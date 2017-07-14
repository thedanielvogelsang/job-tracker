class Category < ApplicationRecord
  belongs_to :job
  validates :title, presence: true, uniqueness: true
end

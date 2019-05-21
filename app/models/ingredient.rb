class Ingredient < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true, allow_blank: false
  has_many :doses
end

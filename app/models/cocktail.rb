class Cocktail < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true, allow_blank: false
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews

  mount_uploader :photo, PhotoUploader
end

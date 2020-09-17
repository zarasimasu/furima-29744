class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :cost_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true
  
  belongs_to :user
  has_one_attached :image
end

class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :status, presence: true
  validates :cost, presence: true
  validates :area, presence: true
  validates :days, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day

end

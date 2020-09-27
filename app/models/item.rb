class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image, :name, :description, :price
  end

  validates :price, format: {with: /\A[0-9]+\z/}
  validates_numericality_of :price, greater_than_or_equal_to: 300
  validates_numericality_of :price, less_than_or_equal_to: 9999999

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :cost_id, :area_id, :day_id
  end

  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :area
  belongs_to_active_hash :day

end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :waitday

  validates :image, :name, :description, :category_id, :status_id,
            :burden_id, :prefecture_id, :wait_day_id, :price, presence: true

  validates :category_id, :status_id,:burden_id, :prefecture_id, :wait_day_id,
             numericality: { other_than: 1 , message: "can't be blank"}

  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters" }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }

end

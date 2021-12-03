class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :wait_day
end

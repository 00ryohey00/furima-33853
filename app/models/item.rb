class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  with_options presence: true do
    validates :image
    validates :title
    validates :explain
    validates :category_id
    validates :status_id
    validates :financial_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end
  validates :category_id, :day_id, :financial_id, :prefecture_id, :status_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :financial
  belongs_to :prefecture
  belongs_to :status
end

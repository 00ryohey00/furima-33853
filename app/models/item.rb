  class Item < ApplicationRecord
    has_one_attached :image

    validates :price, format: { with: /\A[０-９]+\z/}
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
    belongs_to :category, :day, :financial, :prefecture, :status

  end

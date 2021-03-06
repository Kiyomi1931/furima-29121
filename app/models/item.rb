class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :prefecture_id,numericality: {other_than: 0}
    validates :price, format:{with:/\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

    with_options numericality: {other_than: 1} do
      validates :category_id 
      validates :sales_status_id 
      validates :shipping_fee_status_id
      validates :scheduled_delivery_id
    
    end
  end

end
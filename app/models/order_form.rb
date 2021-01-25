class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,:buy_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 0}
    validates :city
    validates :addresses
    validates :phone_number, format: {with:/\A[0-9]+\z/},length: { maximum: 11 } 
    validates :token
  end

  def save
    # 購入履歴の情報を保存
    buy= Buy.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    binding.pry
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building,phone_number: phone_number,buy_id: buy.id)
  end
  
end
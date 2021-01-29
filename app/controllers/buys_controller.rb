class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :check, only: :index

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def check
    @item = Item.find(params[:item_id])
    @buy = Buy.find(params[:item_id])
    if @buy.item_id == @item.id || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

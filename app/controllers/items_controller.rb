class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path 
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id:current_user.id)
  end

  def user_check
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
end
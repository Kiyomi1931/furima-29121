class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item=Item.new
  end

  def create
    Item.create
  end

  private
  def item_params
    params.require(:item).permit(:image, :text).merge(user_id:current_user.id)
  end
end

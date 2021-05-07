class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new 
    @item = Item.new
  end

  def create
    @item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :status_id, :financial_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end
end

class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :burden_id, :prefecture_id, :wait_day_id, :price, :user)
  end

end

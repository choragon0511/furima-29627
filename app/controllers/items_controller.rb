class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @items = Item.includes(:purchase) 販売してるか判別に必要だと思う
    @items = Item.all
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

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :status_id,
      :burden_id, :prefecture_id, :wait_day_id, :price, :user
    ).merge(user_id: current_user.id)
  end
end

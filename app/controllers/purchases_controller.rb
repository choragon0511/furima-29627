class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :mine_move

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:user, :item, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase).merge(token: params[:token])
   end
  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def mine_move
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end

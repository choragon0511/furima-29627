class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :mine_move


  def new
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def mine_move
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end

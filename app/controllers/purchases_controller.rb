class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :mine_move
  before_action :sold_out_move

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def mine_move
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_move
    redirect_to root_path unless @item.purchase.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end

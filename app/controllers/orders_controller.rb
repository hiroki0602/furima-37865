class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :non_purchased_item, only: [:index, :create]
  

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(shipping_address_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def shipping_address_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def non_purchased_item
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

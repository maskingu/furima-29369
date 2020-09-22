class OrdersController < ApplicationController
  before_action :move_to_signed_in
  before_action :move_to_index
  before_action :order_item, only: [:index, :create]
  
  def index
  end

  def new
    @order = ItemOrder.new
  end

  def create
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_item
    @item = Item.find(order_params[:item_id])
    @order = ItemOrder.new(order_params)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def move_to_index
    unless current_user
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end

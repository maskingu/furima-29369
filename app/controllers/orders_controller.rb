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
      redirect_to root_path
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
    redirect_to user_session_path unless user_signed_in?
  end

  def move_to_index
    @item = Item.find(order_params[:item_id])
    redirect_to root_path if user_signed_in? && @item.user == current_user
  end

  def order_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

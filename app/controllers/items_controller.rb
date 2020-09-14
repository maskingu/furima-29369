class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
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

  def calculate
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end

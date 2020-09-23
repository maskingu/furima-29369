class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if user_signed_in? && @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if user_signed_in? && @item.user == current_user
      @item.update(item_params)
      redirect_to item_path
    else
      render :show
    end
  end

  private

  def move_to_index
    redirect_to user_session_path if user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

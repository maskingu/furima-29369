class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]  

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

  # def destroy
  #   item = Item.find(params[:id])
  #   if item.destroy
  #     redirect_to root_path
  #   else
  #     render :show
  #   end
  # end
  # 実装の順番間違えて先に記述してしまったので削除のアクションは一旦コメントアウトしてます

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :status_id, :shipping_charge_id, :shipping_region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

end

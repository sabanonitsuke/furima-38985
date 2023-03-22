class ItemsController < ApplicationController
  before_action :redirect_to_index, only: :new
  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    
  end

  private

  def redirect_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id,
                                 :processing_time_id, :price, :image).merge(user_id: current_user.id)
  end
end

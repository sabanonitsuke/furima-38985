class ItemsController < ApplicationController
  before_action :redirect_to_index, only: :new
  def index
    
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

  private
  def redirect_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    binding.pry
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id, :processing_time_id, :price, :image).merge(:user_id current_user.id)
  end

end

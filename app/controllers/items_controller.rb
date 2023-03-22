class ItemsController < ApplicationController
  before_action :get_item, only: [:show, :edit, :update]
  before_action :redirect_to_session, only: [:new, :edit]
  before_action :redirect_to_index, only: :edit

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def redirect_to_index
    redirect_to root_path unless current_user == @item.user
  end

  def redirect_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :shipping_fee_payer_id, :prefecture_id,
                                 :processing_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end
end

class ItemsController < ApplicationController
  before_action :get_item, except: [:index, :new, :create]
  before_action :redirect_to_session, only: [:new, :edit, :destroy]
  before_action :seller_confirmation, only: [:edit, :update, :destroy]

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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def seller_confirmation
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

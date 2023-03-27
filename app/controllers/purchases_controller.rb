class PurchasesController < ApplicationController
  before_action :get_item, only: [:index]
  before_action :redirect_to_session, only: [:index]
  before_action :buyer_confirmation, only: [:index]

  def index
  end
  
  private
  def get_item
    @item = Item.find(params[:item_id])
  end
  def redirect_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
  def buyer_confirmation
    redirect_to root_path if current_user == @item.user
  end
end

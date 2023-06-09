class PurchasesController < ApplicationController
  before_action :get_item, only: [:index, :create]
  before_action :redirect_to_session, only: [:index, :create]
  before_action :buyer_confirmation, only: [:index, :create]
  before_action :redirect_if_sold_out, only: [:index, :create]

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
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
    return unless current_user == @item.user

    redirect_to root_path
  end

  def purchase_params
    params.require(:purchase_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_sold_out
    return unless @item.purchase.present?

    redirect_to root_path
  end
end

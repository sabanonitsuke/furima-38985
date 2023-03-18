class ItemsController < ApplicationController
  before_action :redirect_to_index, only: :new
  def index
    
  end

  def new
    
  end

  private

  def redirect_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end

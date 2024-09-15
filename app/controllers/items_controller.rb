class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find_by!(id: params[:user_id])
      items = user.items
    else
    items = Item.all
    
   
    end
    render json: items, include: :user
  end

  def show
   item = Item.find_by!(id: params[:id])
   render json: item, include: :user
  end

  def create
   
      user = User.find_by!(id: params[:user_id])
   
    items = user.items.create(item_params)
    render json: items, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end


end

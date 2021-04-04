class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :product_status_id, :shipping_charge_id, :prefecture_id, :days_to_idea_id, :category_id, :price).merge(user_id: current_user.id)
  end

end

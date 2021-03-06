class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
    if current_user.id == @item.user_id
       @item.destroy
       redirect_to root_path
    else
       render :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :product_status_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :category_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id && @item.purchase_management.blank?
       redirect_to action: :index
    end
  end

  

end

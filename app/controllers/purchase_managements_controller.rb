class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:create, :pay_item]


  def index
    @destination_purchase_management = DestinationPurchaseManagement.new
  end

  def create
    @destination_purchase_management = DestinationPurchaseManagement.new(destination_purchase_management_params)
    if @destination_purchase_management.valid?
      pay_item
      @destination_purchase_management.save
      redirect_to root_path
    else
      render :index
    end
  end
 

  private 
  def destination_purchase_management_params
    params.require(:destination_purchase_management).permit(:purchase_management_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :image, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_purchase_management_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase_management.present?
      redirect_to root_path
    end
  end
end

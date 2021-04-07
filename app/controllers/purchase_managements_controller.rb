class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]


  def index
    @destination_purchase_management = DestinationPurchaseManagement.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_c590658db8f1ebdad1717f5c"
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_purchase_management_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase_management.present?
      redirect_to root_path
    end
  end
end
class PurchaseManagementsController < ApplicationController

  def index
    @destination_purchase_management = DestinationPurchaseManagement.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_purchase_management = DestinationPurchaseManagement.new(destination_purchase_management)
    if @destination_purchase_management.valid?
      @destination_purchase_management.save
      redirect_to root_path
    else
      render :index
    end
  end
 

  private 
  def destination_purchase_management
    params.require(:destination_purchase_management).permit(:purchase_management_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :image).merge(user_id: current_user.id, item_id: params[:item_id])
  end




end

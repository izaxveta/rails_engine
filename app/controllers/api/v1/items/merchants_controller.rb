class Api::V1::Items::MerchantsController < ApplicationController
  def index
    item = Item.find(params[:item_id])
    render json: item.merchant, serializer: MerchantSerializer
  end 
end 
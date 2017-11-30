class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all#, serializer: MerchantSerializer
  end

  def show
    render json: Merchant.find(params[:id]), serializer: MerchantSerializer
  end
end
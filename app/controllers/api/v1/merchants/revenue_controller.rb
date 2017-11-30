class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.revenue(merchant_params)
  end

  private

  def merchant_params
    if params[:date] 
      params[:created_at] = params[:date]
      params.permit(:merchant_id ,:created_at)
    else 
      params.permit(:merchant_id)
    end 
  end
end
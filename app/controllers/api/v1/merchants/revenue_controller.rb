class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    
    hash = {}
    if params[:merchant_id]
      hash["revenue"] = Merchant.revenue(merchant_params).to_i / 100.0
      hash["revenue"] = hash["revenue"].to_s
    else 
      hash["total_revenue"] = Merchant.revenue(merchant_params).to_i / 100.0
      hash["total_revenue"] = hash["total_revenue"].to_s
    end 
    render json: hash

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






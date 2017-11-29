class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.revenue(merchant_params)
  end

  private

  def merchant_params
    params[:created_at] = params[:date]
    params.permit[:created_at]
  end
end
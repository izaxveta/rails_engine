class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    merchant = Merchant.find(params[:id])
    merchant.revenue
  end 
end 
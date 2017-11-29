class Api::V1::Merchants::FindAllController < ApplicationController
  def index
    render json: Merchant.find_all_merchants(merchant_params)
  end

  private

  def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end